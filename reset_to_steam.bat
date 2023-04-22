@echo off

for /f "usebackq skip=1 tokens=1,2 delims==" %%i in (config.ini) do (
    if "%%i"=="PATH_ELDEN_RING" set PATH_ELDEN_RING=%%jGame\
)

del ".\data\mod\mods\elden_ring_seamless_coop.dll"
del ".\data\mod\mods\seamlesscoopsettings.ini"

for %%i in (./data/mod/*) do ( 
    del "%PATH_ELDEN_RING%%%i" 
)

for /d %%i in (./data/mod/*) do ( 
    rmdir "%PATH_ELDEN_RING%%%i" 
)

rmdir "%PATH_ELDEN_RING%mods"

cd /d ./data/steam
copy steam_api64.dll "%PATH_ELDEN_RING%"
cd /d %~dp0