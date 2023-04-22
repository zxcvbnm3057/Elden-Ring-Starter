cd /d %~dp0

call reset_to_steam.bat

for /f "usebackq skip=1 tokens=1,2 delims==" %%i in (config.ini) do (
    if "%%i"=="PATH_ELDEN_RING" set PATH_ELDEN_RING=%%jGame\
)

del "%PATH_ELDEN_RING%steam_api64.dll "

cd /d ./data/mod

for %%i in (*) do ( 
    mklink /H "%PATH_ELDEN_RING%%%i" %%i 
)

for /d %%i in (*) do ( 
    mklink /J "%PATH_ELDEN_RING%%%i" %%i
)

cd /d %PATH_ELDEN_RING%
start eldenring.exe