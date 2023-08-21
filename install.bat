pushd %~dp0\resources
@echo off

setlocal

:PROMPT_BLOATWARE
SET /P AREYOUSURE=Bloatware deinstallieren (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO PROMPT_WALLPAPER
echo Uninstall bloat ware ...
powershell -ExecutionPolicy Bypass -File .\uninstall.ps1 %* || exit /b 1

:PROMPT_WALLPAPER
SET /P AREYOUSURE=Desktop Hintergrund setzen (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO PROMPT_GENERIC_INSTALL
echo Set background image ...
powershell -ExecutionPolicy Bypass -File .\wallpaper.ps1 %* || exit /b 1


:PROMPT_GENERIC_INSTALL
SET /P AREYOUSURE=Generische Tools installieren (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO PROMPT_DEV_INSTALL
echo Install tools that come with system integration ...
powershell -ExecutionPolicy Bypass -File .\winget.ps1 %* || exit /b 1

:PROMPT_DEV_INSTALL
SET /P AREYOUSURE=Development Tools installieren (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
echo Install tools without system integration ...
powershell -ExecutionPolicy Bypass -File .\scoop.ps1 %* || exit /b 1

:PROMPT_FONTS
SET /P AREYOUSURE=Schriftarten installieren (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO PROMPT_GENERIC_INSTALL
echo Install fonts Jetbrains Sans and Noto Sans ...
powershell -ExecutionPolicy Bypass -File .\Install-Font.ps1 %* || exit /b 1

:END
endlocal

pause
popd