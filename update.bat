pushd %~dp0
@echo off

echo Update generic tools ...
winget upgrade --all --force --silent

echo Update development tools ...
scoop update *

pause
popd