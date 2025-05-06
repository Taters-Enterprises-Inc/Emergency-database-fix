@echo off
setlocal enabledelayedexpansion

:: Step 1: Find a unique name for the current data folder
cd /d "%~dp0mysql"
set "dataFolder=data"
set /a count=0

:find_name
set /a count+=1
if exist "%dataFolder%_%count%" (
    goto find_name
)
set "newDataName=%dataFolder%_%count%"
echo Renaming data folder to %newDataName%...
rename "%dataFolder%" "%newDataName%"

:: Step 2: Copy backup to new data folder
echo Duplicating 'backup' folder to 'data'...
xcopy "backup" "data" /E /I /H /Y

:: Step 3: Copy user data from old data folder, excluding specific directories
echo Copying old user databases (excluding system schemas)...
for /d %%D in ("%newDataName%\*") do (
    set "folderName=%%~nxD"
    if /I not "!folderName!"=="mysql" if /I not "!folderName!"=="performance_schema" if /I not "!folderName!"=="phpmyadmin" if /I not "!folderName!"=="test" (
        echo Copying folder: !folderName!
        xcopy "%%D" "data\!folderName!" /E /I /H /Y
    )
)

:: Step 4: Copy ibdata1 file
echo Copying ibdata1 file from %newDataName% to data...
copy /Y "%newDataName%\ibdata1" "data\ibdata1"

echo.
echo ✅ Done. Please start MySQL in XAMPP again.
pause
