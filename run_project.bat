@echo off
set TOMCAT_HOME=C:\Tomcat\apache-tomcat-10.1.36
set APP_NAME=AIDigitalDetoxPlanner
set DEPLOY_DIR=%TOMCAT_HOME%\webapps\%APP_NAME%

echo ===================================================
echo [1/4] Listing Java Source Files...
echo ===================================================
dir /s /b src\main\java\*.java > src_files.txt

echo ===================================================
echo [2/4] Compiling Java source files...
echo ===================================================
if not exist build\classes mkdir build\classes
javac --release 17 -d build/classes -cp "%TOMCAT_HOME%\lib\servlet-api.jar;%TOMCAT_HOME%\lib\jsp-api.jar;src\main\webapp\WEB-INF\lib\mysql-connector-j-9.7.0.jar;build\classes" @src_files.txt
if %ERRORLEVEL% NEQ 0 (
    echo Compilation failed!
    del src_files.txt
    pause
    exit /b %ERRORLEVEL%
)
del src_files.txt
echo Compilation successful!

echo ===================================================
echo [3/4] Deploying files to Tomcat webapps...
echo ===================================================
if not exist "%DEPLOY_DIR%" mkdir "%DEPLOY_DIR%"
xcopy /s /e /y "src\main\webapp\*" "%DEPLOY_DIR%\"
if not exist "%DEPLOY_DIR%\WEB-INF\classes" mkdir "%DEPLOY_DIR%\WEB-INF\classes"
xcopy /s /e /y "build\classes\*" "%DEPLOY_DIR%\WEB-INF\classes\"

echo ===================================================
echo [4/4] Starting Tomcat Server...
echo ===================================================
echo Starting Tomcat in a separate window. You can access the app at:
echo http://localhost:8080/%APP_NAME%/
echo.
start "" "%TOMCAT_HOME%\bin\startup.bat"
