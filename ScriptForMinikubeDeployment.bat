@echo off
setlocal enabledelayedexpansion

set COUNT=1
set MAX_RUNS=50
set WAIT_TIME=120

:loop
echo Run %COUNT% of %MAX_RUNS%
echo Timestamp: %date% %time%
echo.

set /a remainder=COUNT %% 2
if %remainder% == 1 (
    echo Applying deploymentOne.yaml...
    kubectl apply -f deploymentOne.yaml
) else (
    echo Applying deploymentTwo.yaml...
    kubectl apply -f deploymentTwo.yaml
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