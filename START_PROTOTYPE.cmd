@echo off
setlocal
cd /d "%~dp0"
echo Prototype: http://localhost:8010/index.html
start "" "http://localhost:8010/index.html"
set "SNAP_PYTHON=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if exist "%SNAP_PYTHON%" (
  "%SNAP_PYTHON%" -m http.server 8010
) else (
  py -m http.server 8010 2>nul || python -m http.server 8010
)
