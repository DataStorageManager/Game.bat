@echo off
echo Welcome to the Number Guessing Game!
echo.
echo Think of a number between 1 and 100. I will try to guess it within 7 tries.
set /a min=1
set /a max=100
set /a tries=7
:guess
set /a guess=(min+max)/2
echo My guess is %guess%.
set /p feedback=Enter 'h' for too high, 'l' for too low, or 'c' for correct: 
if "%feedback%"=="h" (
  set /a max=%guess%-1
) else if "%feedback%"=="l" (
  set /a min=%guess%+1
) else if "%feedback%"=="c" (
  echo Hooray! I guessed it! Thanks for playing.
  goto :end_game
) else (
  echo Invalid input. Please try again.
  goto :guess
)
set /a tries-=1
if %tries%==0 (
  echo Oops, I ran out of tries. The number you were thinking of was %guess%.
  goto :end_game
) else (
  echo I have %tries% tries left.
  goto :guess
)
:end_game
set /p play_again=Do you want to play again? Press y for Yes or any other key to exit.
if "%play_again%"=="y" goto game

