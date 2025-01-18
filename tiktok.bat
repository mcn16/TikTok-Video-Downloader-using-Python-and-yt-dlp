@echo off
color 0A
:banner
 echo
 echo  _____ ___ _    __________________  __ __
 echo / ___//   | |  / / ____/_  __/ __ \/ //_/
 echo \__ \/ /| | | / / __/   / / / / / / ,<   
 echo___/ / ___ | |/ / /___  / / / /_/ / /| |  
echo/____/_/  |_|___/_____/ /_/  \____/_/ |_|  
echo                                           
echo                                                                                   
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
if "%choice%"=="2" goto add_urls
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

:add_urls
:input_url
set /p URL=Enter the URL (type 'menu' to return to the main menu): 
if "%URL%"=="menu" goto menu
set URLS=%URLS% %URL%
echo URLs added so far: %URLS%
goto input_url



:end
echo Exiting...
pause