@echo off
setlocal EnableDelayedExpansion
set "prev_min="
set "prev_max="
set "result="

:input
if not defined min (
    cls
    echo Random Number Generator
    echo.
    echo !result!
    set /p "min=Enter minimum number: "
) else (
    set /p "input=Enter minimum number (or press Enter to reuse previous value %prev_min%): " || set "input=!prev_min!"
    if defined input set "min=!input!"
)

if not defined max (
    set /p "max=Enter maximum number: "
) else (
    set /p "input=Enter maximum number (or press Enter to reuse previous value %prev_max%): " || set "input=!prev_max!"
    if defined input set "max=!input!"
)

echo.
echo Generating random number between %min% and %max%...
set /a range=max-min+1
set /a random_num=%random% %% range + min
echo The random number generated is: %random_num%
echo.
set "result=!result!%random_num% "
pause > nul

:menu
cls
echo Random Number Generator
echo ---------------------------------
echo : The random number(s)          :
echo : generated so far:            :
echo :                             :
echo :    !result!                :
echo :                              :
echo ---------------------------------
echo.
set /p "choice=Press [1] to generate another number with the same min and max, [2] to enter new min and max, or [3] to exit the program: "

if "%choice%"=="1" goto input
if "%choice%"=="2" (
    set "prev_min=%min%"
    set "prev_max=%max%"
    set "min="
    set "max="
    set "result="
    goto input
)
if "%choice%"=="3" exit /b
goto menu
