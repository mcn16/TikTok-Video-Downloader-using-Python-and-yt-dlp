@echo off
color 0A

cd "C:\Users\miran\TikTok-Video-Downloader-using-Python-and-yt-dlp"
if %ERRORLEVEL% NEQ 0 (
    echo Failed to change directory to TikTok-Video-Downloader-using-Python-and-yt-dlp
    pause
    goto end
)
echo Changed directory to TikTok-Video-Downloader-using-Python-and-yt-dlp

call venv\Scripts\activate
if %ERRORLEVEL% NEQ 0 (
    echo Failed to activate virtual environment, go to command prompt and type python -m venv venv
    pause
    goto end
)
echo Virtual environment activated

set URLS=
set SAVEPATH=

:menu
echo Please choose an option:
echo 1. Run Script
echo 2. Add a URL
echo 3. Change Save Path(default is unfiled)
echo 4. Exit
set /p choice=Enter your choice (1, 2, 3, or 4):

if "%choice%"=="1" goto run_script
if "%choice%"=="2" goto add_urls
if "%choice%"=="3" goto change_save_folder
if "%choice%"=="4" goto end

goto menu

:run_script
if "%SAVEPATH%"=="" (
    set SAVEPATH=unfiled)
echo Running Python script with URLs: %URLS% and save path: %SAVEPATH%
python tik-tok-downloader.py %URLS% %SAVEPATH%
if %ERRORLEVEL% NEQ 0 (
    echo Failed to run the Python script
    pause
    goto menu
)
echo Python script executed successfully
pause
goto menu

:add_urls
:input_url
set /p URL=Enter the URL (type 'menu' to return to the main menu):
if "%URL%"=="menu" goto menu
set URLS=%URLS% "%URL%"
echo URLs added so far: %URLS%
goto input_url

:change_save_folder
set /p SAVEPATH=Enter the folder name where videos will be saved:
echo Save folder changed to: %SAVEPATH%
goto menu

:end
echo Exiting...
pause