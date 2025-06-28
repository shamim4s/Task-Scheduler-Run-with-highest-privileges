@echo off
setlocal

REM === Customize these variables ===
set "TASK_NAME=Start FileServer"
set "APPLICATION_PATH=C:\Windows\filebrowser\FilebrowserMonitor.exe"
set "TASK_DESCRIPTION=Automatically starts FilebrowserMonitor at boot"
set "TRIGGER_TYPE=boot"  REM options: boot, logon, daily, etc.
set "DELAY_SECONDS=15"
set "RUN_AS_USER=Administrators"  REM Use System or specify a username (e.g., Admin)
set "RUN_WITH_HIGHEST_PRIVILEGES=true"
set "USERNAME=Admin"
set "PASSWORD=Colomtk2020!"
REM ==================================

REM === Delete existing task if it exists ===
schtasks /Delete /F /TN "%TASK_NAME%" >nul 2>&1

REM === Build trigger string ===
if /i "%TRIGGER_TYPE%"=="boot" (
    set "TRIGGER_ARG=/SC ONSTART"
) else if /i "%TRIGGER_TYPE%"=="logon" (
    set "TRIGGER_ARG=/SC ONLOGON"
) else (
    echo Unsupported trigger type: %TRIGGER_TYPE%
    exit /b 1
)

REM === Set /RL option for highest privileges ===
if /i "%RUN_WITH_HIGHEST_PRIVILEGES%"=="true" (
    set "PRIVILEGE_ARG=/RL HIGHEST"
) else (
    set "PRIVILEGE_ARG=/RL LIMITED"
)

REM === Create the task ===
if /i "%RUN_AS_USER%"=="Administrators" (
    schtasks /Create ^
        /TN "%TASK_NAME%" ^
        /TR "\"%APPLICATION_PATH%\"" ^
        %TRIGGER_ARG% ^
        /DELAY 0000:%DELAY_SECONDS% ^
        /RU Administrators ^
        %PRIVILEGE_ARG% ^
        /F
) else if /i "%RUN_AS_USER%"=="System" (
    schtasks /Create ^
        /TN "%TASK_NAME%" ^
        /TR "\"%APPLICATION_PATH%\"" ^
        %TRIGGER_ARG% ^
        /DELAY 0000:%DELAY_SECONDS% ^
        /RU SYSTEM ^
        %PRIVILEGE_ARG% ^
        /F
    ) else  (
    schtasks /Create ^
        /TN "%TASK_NAME%" ^
        /TR "\"%APPLICATION_PATH%\"" ^
        %TRIGGER_ARG% ^
        /DELAY 0000:%DELAY_SECONDS% ^
        /RU "%USERNAME%" ^
        /RP "%PASSWORD%" ^
        %PRIVILEGE_ARG% ^
        /F
)

echo.
echo Task "%TASK_NAME%" has been created successfully.
endlocal
pause

