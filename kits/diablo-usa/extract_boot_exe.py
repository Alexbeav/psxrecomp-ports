"""Extract and verify a title-specific PS-X EXE from a CUE/BIN disc dump.

Uses only the Python standard library. The expected path and digest come from
setup-manifest.json, so the distributable contains no disc-derived bytes.
"""

from __future__ import annotations

import hashlib
import json
import pathlib
import re
import sys


RAW_SECTOR = 2352
USER_SECTOR = 2048


def cue_data_track(cue: pathlib.Path) -> tuple[pathlib.Path, int, int]:
    text = cue.read_text(encoding="utf-8", errors="replace")
    current_file: pathlib.Path | None = None
    for raw in text.splitlines():
        file_match = re.match(r'^\s*FILE\s+"([^"]+)"\s+BINARY\s*$', raw, re.I)
        if file_match:
            current_file = cue.parent / file_match.group(1)
            continue
        track_match = re.match(r'^\s*TRACK\s+\d+\s+(MODE[12]/(?:2048|2352))\s*$', raw, re.I)
        if not track_match or current_file is None:
            continue
        mode = track_match.group(1).upper()
        if mode == "MODE1/2048":
            return current_file, USER_SECTOR, 0
        if mode == "MODE1/2352":
            return current_file, RAW_SECTOR, 16
        if mode == "MODE2/2352":
            return current_file, RAW_SECTOR, 24
    raise SystemExit("no supported MODE1/2048, MODE1/2352, or MODE2/2352 data track found")


def read_user_sector(source, lba: int, sector_size: int, data_offset: int) -> bytes:
    source.seek(lba * sector_size + data_offset)
    data = source.read(USER_SECTOR)
    if len(data) != USER_SECTOR:
        raise SystemExit(f"truncated data track at LBA {lba}")
    return data


def extent(record: bytes) -> tuple[int, int]:
    if len(record) < 34 or record[0] < 34:
        raise SystemExit("invalid ISO9660 directory record")
    return int.from_bytes(record[2:6], "little"), int.from_bytes(record[10:14], "little")


def root_file(source, wanted_name: str, sector_size: int, data_offset: int) -> tuple[int, int]:
    pvd = read_user_sector(source, 16, sector_size, data_offset)
    if pvd[:7] != b"\x01CD001\x01":
        raise SystemExit("data track has no ISO9660 primary volume descriptor")
    record_length = pvd[156]
    root_lba, root_size = extent(pvd[156:156 + record_length])
    directory = bytearray()
    for offset in range(0, root_size, USER_SECTOR):
        directory.extend(read_user_sector(source, root_lba + offset // USER_SECTOR,
                                          sector_size, data_offset))
    wanted = wanted_name.upper().encode("ascii")
    offset = 0
    while offset < root_size:
        length = directory[offset]
        if length == 0:
            offset = ((offset // USER_SECTOR) + 1) * USER_SECTOR
            continue
        record = bytes(directory[offset:offset + length])
        name_length = record[32]
        if record[33:33 + name_length].upper() == wanted:
            return extent(record)
        offset += length
    raise SystemExit(f"{wanted_name} was not found in the disc root directory")


def main() -> int:
    if len(sys.argv) != 4:
        print("usage: extract_boot_exe.py <setup-manifest.json> <disc.cue> <output-dir>")
        return 2
    manifest = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
    cue = pathlib.Path(sys.argv[2]).resolve()
    output = pathlib.Path(sys.argv[3]).resolve()
    source_path, sector_size, data_offset = cue_data_track(cue)
    if not source_path.is_file():
        raise SystemExit(f"CUE data track not found: {source_path}")
    with source_path.open("rb") as source:
        file_lba, file_size = root_file(source, manifest["boot_path"] + ";1",
                                        sector_size, data_offset)
        result = bytearray()
        for offset in range(0, file_size, USER_SECTOR):
            result.extend(read_user_sector(source, file_lba + offset // USER_SECTOR,
                                           sector_size, data_offset))
    data = bytes(result[:file_size])
    digest = hashlib.sha256(data).hexdigest().upper()
    expected = manifest["boot_exe_sha256"].upper()
    if digest != expected:
        print(f"ERROR: unsupported disc revision: expected {expected}, got {digest}")
        return 3
    output.mkdir(parents=True, exist_ok=True)
    target = output / manifest["boot_path"]
    target.write_bytes(data)
    print(f"Verified and extracted {manifest['boot_path']} ({len(data)} bytes; SHA-256 {digest})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
