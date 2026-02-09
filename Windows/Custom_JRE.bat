@echo off 
echo =========================================== 
echo Creation du JRE ...
echo =========================================== 
echo.

REM ------------- Incluez les modules nécéssaires à votre Jar -------------
set MODULES=java.base,java.desktop,java.compiler,java.datatransfer,java.logging,java.management,java.management.rmi,java.naming,java.net.http,java.prefs,java.scripting,java.se,java.security.jgss,java.sql,java.sql.rowset,java.transaction.xa,java.xml,jdk.accessibility,jdk.charsets,jdk.compiler,jdk.crypto.cryptoki,jdk.crypto.ec,jdk.crypto.mscapi,jdk.dynalink,jdk.httpserver,jdk.jartool,jdk.javadoc,jdk.jcmd,jdk.jconsole,jdk.jdeps,jdk.jdi,jdk.jdwp.agent,jdk.jfr,jdk.jlink,jdk.jshell,jdk.jsobject,jdk.jstatd,jdk.localedata,jdk.management,jdk.management.agent,jdk.management.jfr,jdk.naming.dns,jdk.naming.rmi,jdk.net,jdk.sctp,jdk.security.auth,jdk.security.jgss,jdk.unsupported,jdk.unsupported.desktop,jdk.xml.dom,javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web
set RUNTIME_DIR=%CD%\jre
set OUTPUT_DIR=%CD%\dist

REM ------------------------------------------------ 
echo Suppression d'anciens fichiers... 
if exist "%RUNTIME_DIR%" rmdir /s /q "%RUNTIME_DIR%" 
if exist "%OUTPUT_DIR%" rmdir /s /q "%OUTPUT_DIR%" 
mkdir "%OUTPUT_DIR%"

REM ------------- Creation du JRE--------------- 
echo Creation du runtime minimal avec jlink... 
jlink ^
    --add-modules %MODULES% ^ --output "%RUNTIME_DIR%" ^
    --strip-debug ^ --no-man-pages ^ --no-header-files ^
    --compress=2 

if errorlevel 1 ( 
    echo [ERREUR] Echec de la creation du runtime pause exit /b 1 
    pause
    exit /b 1
)    
    
echo Runtime cree avec succes. 
echo.
pause
