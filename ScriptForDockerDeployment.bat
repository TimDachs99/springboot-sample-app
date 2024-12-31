@echo off
setlocal enabledelayedexpansion

set COUNT=1
set MAX_RUNS=50
set WAIT_TIME=120

:loop
echo Run %COUNT% of %MAX_RUNS%
echo Timestamp: %date% %time%
echo.

echo Stopping container springboot-sample-app (if running)...
docker stop springboot-sample-app >nul 2>&1
if %ERRORLEVEL% neq 0 echo Container springboot-sample-app is not running.

echo Removing container springboot-sample-app (if exists)...
docker rm springboot-sample-app >nul 2>&1
if %ERRORLEVEL% neq 0 echo Container springboot-sample-app does not exist.

echo Starting new container springboot-sample-app...
docker run --name springboot-sample-app --network springboot-sample-app_default -d -p 8080:8080 springboot-sample-app:1.0
if %ERRORLEVEL% equ 0 (
    echo Container springboot-sample-app started successfully!
) else (
    echo Failed to start container springboot-sample-app.
)

echo.
echo Waiting 2 minutes before next run...
echo.

set /a COUNT+=1

if %COUNT% leq %MAX_RUNS% (
    timeout /t %WAIT_TIME% /nobreak
    goto loop
) else (
    echo All %MAX_RUNS% runs completed.
    pause
    exit
)