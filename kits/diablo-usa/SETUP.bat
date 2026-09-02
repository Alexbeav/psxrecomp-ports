@echo off
setlocal
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0SETUP.ps1" %*
set "rc=%ERRORLEVEL%"
if not "%rc%"=="0" (
  echo.
  echo Setup failed. Review setup.log; redact personal paths before reporting it.
  pause
)
exit /b %rc%
