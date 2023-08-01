pushd %~dp0
@echo off
echo Set background image ...
powershell -ExecutionPolicy Bypass -File .\wallpaper.ps1 %* || exit /b 1

echo Install tools that come with system integration ...
powershell -ExecutionPolicy Bypass -File .\winget.ps1 %* || exit /b 1

echo Install tools without system integration ...
powershell -ExecutionPolicy Bypass -File .\scoop.ps1 %* || exit /b 1
pause
popd