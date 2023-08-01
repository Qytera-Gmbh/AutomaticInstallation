pushd %~dp0
@echo off

echo Uninstall bloat ware ...
powershell -ExecutionPolicy Bypass -File .\resources\uninstall.ps1 %* || exit /b 1

echo Set background image ...
powershell -ExecutionPolicy Bypass -File .\resources\wallpaper.ps1 %* || exit /b 1

echo Install tools that come with system integration ...
powershell -ExecutionPolicy Bypass -File .\resources\winget.ps1 %* || exit /b 1

echo Install tools without system integration ...
powershell -ExecutionPolicy Bypass -File .\resources\scoop.ps1 %* || exit /b 1
pause
popd