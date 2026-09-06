@echo off
setlocal
set "SNAP_NODE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
if not exist "%SNAP_NODE%" set "SNAP_NODE=node"
"%SNAP_NODE%" "%~dp0..\tools\build-prototype.mjs" --publish
if errorlevel 1 (
  echo.
  echo Prototype publish failed. Review the error above.
  pause
  exit /b 1
)
echo.
echo Prototype projects were published locally.
pause
