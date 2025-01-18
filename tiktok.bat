@echo off
color 0A
cd TikTok-Video-Downloader-using-Python-and-yt-dlp
venv\Scripts\activate

:menu
echo Please choose an option:
echo 1. Run the Python script
echo 2. Add a URL to the Python script argument "URLs"
echo 3. Exit
set /p choice=Enter your choice (1, 2, or 3): 

if "%choice%"=="1" goto run_script
if "%choice%"=="2" goto add_url
if "%choice%"=="3" goto end

goto menu

:run_script
python tik-tok-downloader.py %URLS%
pause
goto end

:add_url
set /p URL=Enter the URL: 
set URLS=%URLS% %URL%
goto menu

:end
echo Exiting...