@echo off
REM ========================================================
REM Antigravity automatic fix script
REM Automatically detects current Windows user
REM ========================================================

echo Running as user: %USERNAME%

REM --------------------------------------------------------
REM Step 1: Kill running Antigravity processes
REM --------------------------------------------------------
echo Stopping Antigravity processes...
taskkill /F /IM Antigravity.exe >nul 2>&1

REM --------------------------------------------------------
REM Step 2: Ensure C:\Temp exists
REM --------------------------------------------------------
echo Ensuring C:\Temp exists...
mkdir C:\Temp >nul 2>&1

REM --------------------------------------------------------
REM Step 3: Fix environment variables (session only)
REM --------------------------------------------------------
echo Fixing environment variables...
set TEMP=C:\Temp
set TMP=C:\Temp
set APPDATA=%USERPROFILE%\AppData\Roaming
set LOCALAPPDATA=%USERPROFILE%\AppData\Local

REM --------------------------------------------------------
REM Step 4: Change directory to Antigravity install path
REM --------------------------------------------------------
set ANTIGRAVITY_PATH=%USERPROFILE%\AppData\Local\Programs\Antigravity
echo Changing directory to %ANTIGRAVITY_PATH%
cd /d "%ANTIGRAVITY_PATH%"

REM --------------------------------------------------------
REM Step 5: Launch Antigravity with clean profile
REM --------------------------------------------------------
echo Launching Antigravity...
Antigravity.exe --user-data-dir="C:\Temp\antigravity-profile"
