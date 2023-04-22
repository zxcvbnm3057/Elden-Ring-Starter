@echo off

cd /d %~dp0

call reset_to_steam.bat

for /f "usebackq skip=1 tokens=1,2 delims==" %%i in (config.ini) do (
    if "%%i"=="PATH_ELDEN_RING" set PATH_ELDEN_RING=%%jGame\
)

del "%PATH_ELDEN_RING%steam_api64.dll "

cd /d ./data/mod

if exist ".\steam_api64.dll" (
    del "%PATH_ELDEN_RING%steam_api64.dll"
)

for %%i in (*) do ( 
    mklink /H "%PATH_ELDEN_RING%%%i" %%i 
)

for /d %%i in (*) do ( 
    mklink /J "%PATH_ELDEN_RING%%%i" %%i
)

mkdir %PATH_ELDEN_RING%mods

mklink /H "%PATH_ELDEN_RING%mods\elden_ring_seamless_coop.dll" ".\SeamlessCoop\elden_ring_seamless_coop.dll"
mklink /H "%PATH_ELDEN_RING%mods\seamlesscoopsettings.ini" ".\SeamlessCoop\seamlesscoopsettings.ini"

start "" "%PATH_ELDEN_RING%modengine2_launcher.exe"

