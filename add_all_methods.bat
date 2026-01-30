@echo off
setlocal enabledelayedexpansion

set "mainFile=e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
set "methodsFile=e:\proj01Mapbox\all_methods.txt"
set "tempFile=e:\proj01Mapbox\MainActivity_temp.java"

REM Copy all but the last line to temp file
powershell -Command "(Get-Content '%mainFile%') | Select-Object -SkipLast 1 | Set-Content '%tempFile%'"

REM Append the methods
type "%methodsFile%" >> "%tempFile%"

REM Replace the original file
move /y "%tempFile%" "%mainFile%"

echo All methods added successfully!
