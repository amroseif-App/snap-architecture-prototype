@echo off
setlocal
set "SNAP_NODE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
if not exist "%SNAP_NODE%" set "SNAP_NODE=node"
"%SNAP_NODE%" "%~dp0..\tools\build-prototype.mjs"
if errorlevel 1 (
  echo.
  echo Prototype update failed. Review the error above.
  pause
  exit /b 1
)
echo.
echo Prototype candidate media and data are ready for review.
echo Run PUBLISH_PROTOTYPE.cmd only after approval.
pause
