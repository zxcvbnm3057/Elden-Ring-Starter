rem Copyright 2023 Fengying <zxcvbnm3057@outlook.com>
rem 
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem 
rem     http://www.apache.org/licenses/LICENSE-2.0
rem 
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

for /f "usebackq skip=1 tokens=1,2 delims==" %%i in (config.ini) do (
    if "%%i"=="PATH_ELDEN_RING" set PATH_ELDEN_RING=%%jGame\
)

for %%i in (./data/mod/*) do ( 
    del "%PATH_ELDEN_RING%%%i" 
)

for /d %%i in (./data/mod/*) do ( 
    rmdir "%PATH_ELDEN_RING%%%i" 
)

cd /d ./data/steam
copy steam_api64.dll "%PATH_ELDEN_RING%"
cd /d %~dp0