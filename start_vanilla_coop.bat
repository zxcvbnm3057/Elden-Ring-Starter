@echo off

cd /d %~dp0

call reset_to_steam.bat

for /f "usebackq skip=1 tokens=1,2 delims==" %%i in (config.ini) do (
    if "%%i"=="PATH_ELDEN_RING" set PATH_ELDEN_RING=%%jGame\
)

del "%PATH_ELDEN_RING%steam_api64.dll "

cd /d ./data/mod

mklink /H "%PATH_ELDEN_RING%mod_loader_config.ini" ".\mod_loader_config.ini"
mklink /H "%PATH_ELDEN_RING%dinput8.dll" ".\dinput8.dll"

mkdir "%PATH_ELDEN_RING%mods"

mklink /J "%PATH_ELDEN_RING%SeamlessCoop" ".\SeamlessCoop"
mklink /H "%PATH_ELDEN_RING%mods\elden_ring_seamless_coop.dll" ".\SeamlessCoop\elden_ring_seamless_coop.dll"
mklink /H "%PATH_ELDEN_RING%mods\seamlesscoopsettings.ini" ".\SeamlessCoop\seamlesscoopsettings.ini"


if exist ".\steam_api64.dll" (
    del "%PATH_ELDEN_RING%steam_api64.dll"
    mklink /H "%PATH_ELDEN_RING%steam_api64.dll" ".\steam_api64.dll"
)
if exist ".\steam_settings" mklink /J "%PATH_ELDEN_RING%steam_settings" ".\steam_settings"


cd /d %PATH_ELDEN_RING%
start eldenring.exe
