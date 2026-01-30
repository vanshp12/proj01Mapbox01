@echo off
setlocal enabledelayedexpansion

set "mainFile=e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
set "methodsFile=e:\proj01Mapbox\transport_methods_temp.txt"
set "tempFile=e:\proj01Mapbox\MainActivity_temp.java"

REM Read the main file and find the last line
set "lastLine="
for /f "delims=" %%a in ('type "%mainFile%"') do set "lastLine=%%a"

REM Copy all but the last line to temp file
more +0 "%mainFile%" > "%tempFile%"
powershell -Command "(Get-Content '%tempFile%') | Select-Object -SkipLast 1 | Set-Content '%tempFile%'"

REM Append the methods
type "%methodsFile%" >> "%tempFile%"

REM Replace the original file
move /y "%tempFile%" "%mainFile%"

echo Methods added successfully!
