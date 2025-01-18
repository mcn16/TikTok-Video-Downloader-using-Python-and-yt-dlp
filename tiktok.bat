@echo off
color 0A

cd "C:\Users\miran\TikTok-Video-Downloader-using-Python-and-yt-dlp"
if %ERRORLEVEL% NEQ 0 (
    echo Failed to change directory to TikTok-Video-Downloader-using-Python-and-yt-dlp
    pause
    goto end
)


call venv\Scripts\activate
if %ERRORLEVEL% NEQ 0 (
    echo Failed to activate virtual environment
    pause
    goto end
)


:menu
echo Please choose an option:
echo 1. Run Script
echo 2. Add a URL
echo 3. Exit
set /p choice=Enter your choice (1, 2, or 3): 

if "%choice%"=="1" goto run_script
if "%choice%"=="2" goto add_url
if "%choice%"=="3" goto end


goto menu

:run_script
echo Running Python script with URLs: %URLS%
python tik-tok-downloader.py %URLS%
if %ERRORLEVEL% NEQ 0 (
    echo Failed to run the Python script
    pause
    goto end
)
pause
goto end

:add_url
set /p URL=Enter the URL: 
set URLS=%URLS% %URL%
echo URLs: %URLS%
goto menu



:end
echo Exiting...
pause