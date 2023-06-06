@echo off
setlocal EnableDelayedExpansion

echo "Welcome to the Number Guessing Game. The computer has randomly chosen a number between 1 and 100.  Just guess the number. Good luck!"

set /a answer=%RANDOM% %%100 + 1
set /a attempts=0

echo I'm thinking of a number between 1 and 100.
echo Can you guess what it is?

:guess
set /a attempts+=1
set /p guess=Enter your guess: 

if %guess%==%answer% (
  echo Congratulations, You guessed the number in %attempts% attempts!
  pause
  goto end
) else if %guess% lss %answer% (
  echo Too low. Try again.
) else (
  echo Too high. Try again.
)

goto guess

:end
exit
