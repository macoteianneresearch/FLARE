@echo off
setlocal
cd /d "%~dp0"
title FLARE - Fire Literature Analysis and Research Explorer

echo.
echo ==========================================
echo   FLARE - First-time setup and launcher
echo ==========================================
echo.

where py >nul 2>nul
if %errorlevel%==0 (
    set "PYTHON=py"
) else (
    where python >nul 2>nul
    if %errorlevel%==0 (
        set "PYTHON=python"
    ) else (
        echo Python was not found.
        echo Install Python 3.10 or newer from https://www.python.org/downloads/
        echo During installation, enable "Add Python to PATH".
        pause
        exit /b 1
    )
)

if not exist ".venv\\Scripts\\python.exe" (
    echo [1/3] Creating the FLARE Python environment...
    %PYTHON% -m venv .venv
    if errorlevel 1 goto error
)

echo [2/3] Installing or checking required packages...
".venv\\Scripts\\python.exe" -m pip install --upgrade pip
if errorlevel 1 goto error
".venv\\Scripts\\python.exe" -m pip install -r backend\\requirements.txt
if errorlevel 1 goto error

echo [3/3] Starting FLARE...
echo.
echo FLARE will open in your browser at http://127.0.0.1:8000
echo Keep this window open while using FLARE.
echo To stop the app, close this window or press Ctrl+C.
echo.
start "" http://127.0.0.1:8000
".venv\\Scripts\\python.exe" -m uvicorn backend.server:app --host 127.0.0.1 --port 8000
goto end

:error
echo.
echo Setup could not finish. Check the error above and make sure Python 3.10+ is installed.
pause
exit /b 1

:end
pause
