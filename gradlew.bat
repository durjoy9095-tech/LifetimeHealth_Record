@echo off
setlocal
set "APP_HOME=%~dp0"
set "PROPS=%APP_HOME%gradle\wrapper\gradle-wrapper.properties"
for /f "tokens=1,* delims==" %%A in ('findstr /B "distributionUrl=" "%PROPS%"') do set "DIST_URL=%%B"
set "DIST_URL=%DIST_URL:\:=:%"
for %%A in ("%DIST_URL%") do set "DIST_FILE=%%~nxA"
set "DIST_NAME=%DIST_FILE:.zip=%"
set "CACHE=%USERPROFILE%\.gradle\wrapper\dists\%DIST_NAME%"
if not exist "%CACHE%\%DIST_NAME%\bin\gradle.bat" (
  if not exist "%CACHE%" mkdir "%CACHE%"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing '%DIST_URL%' -OutFile '%CACHE%\%DIST_FILE%'"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Force '%CACHE%\%DIST_FILE%' '%CACHE%'"
)
call "%CACHE%\%DIST_NAME%\bin\gradle.bat" %*
