pushd %~dp0\resources
@echo off

echo Uninstall bloat ware ...
powershell -ExecutionPolicy Bypass -File .\uninstall.ps1 %* || exit /b 1

echo Set background image ...
powershell -ExecutionPolicy Bypass -File .\wallpaper.ps1 %* || exit /b 1

echo Install tools that come with system integration ...
powershell -ExecutionPolicy Bypass -File .\winget.ps1 %* || exit /b 1

echo Install tools without system integration ...
powershell -ExecutionPolicy Bypass -File .\scoop.ps1 %* || exit /b 1
pause
popd