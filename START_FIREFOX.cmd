@echo off
setlocal
cd /d "%~dp0"

set "SNAP_URL=http://127.0.0.1:8010/index.html"
set "SNAP_PYTHON=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
set "SNAP_FIREFOX=%ProgramFiles%\Mozilla Firefox\firefox.exe"
if not exist "%SNAP_FIREFOX%" set "SNAP_FIREFOX=%ProgramFiles(x86)%\Mozilla Firefox\firefox.exe"

echo Opening SNAP Prototype in Firefox:
echo %SNAP_URL%

if exist "%SNAP_FIREFOX%" (
  start "" "%SNAP_FIREFOX%" "%SNAP_URL%"
) else (
  start "" firefox "%SNAP_URL%"
)

if exist "%SNAP_PYTHON%" (
  "%SNAP_PYTHON%" -m http.server 8010 --bind 127.0.0.1
) else (
  py -m http.server 8010 --bind 127.0.0.1 2>nul || python -m http.server 8010 --bind 127.0.0.1
)

