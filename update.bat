pushd %~dp0
@echo off

echo Update generic tools ...
winget upgrade --all --force --silent

echo Update development tools ...
WHERE scoop
IF %ERRORLEVEL% == 0 (scoop update *)

pause
popd