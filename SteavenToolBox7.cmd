echo off
mode con: cols=160 lines=78
powershell.exe "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
:start
color b
title SteavenToolBox for Windows 7! v1.0
cls
echo =====================================================================
echo "SteavenToolBox for Windows 7! v1.0 | We care about your OLD pc!"
echo =====================================================================
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Enable / Disable Windows 7 Features 
echo 2. Clear Temp Files
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto features
if '%choice%'=='2' goto temp
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:features
cls
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Main
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Disable Internet Exploerer
echo 2. Enable Interent Exploerer
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='0' goto start
if '%choice%'=='1' dism /online /NoRestart /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64
if '%choice%'=='2' dism /online /NoRestart /Enable-Feature /FeatureName:Internet-Explorer-Optional-amd64
ECHO "%choice%" is not valid, try again
goto start
:temp 
cls
color 4
SC stop DoSvc
del c:\WIN386.SWP
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items*.*
del /s /f /q %windir%\temp\*.*  
del /s /f /q %windir%\Prefetch\*.*      
del /s /f /q "%SysteDrive%\Temp"\*.*  
del /s /f /q %temp%\*.*  
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*  
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.* 
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*       
del /s /f /q "%USERPROFILE%\Recent"\*.*    
del /s /f /q "%USERPROFILE%\Cookies"\*.* 
goto start