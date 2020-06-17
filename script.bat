
: ------> TYPE OF  
:choice
set /P c=Is This PC For  (1) Or    (2)?
if /I "%c%" EQU "1" goto :TWO
if /I "%c%" EQU "2" goto :ONE

: ---->   RENS   SETUP
:ONE 
set 1=ANYNUMBER
GOTO :NEXT1
    : ---> OPTIONS FOR PC IP SETUP
:NEXT1
ECHO Is This  PC For   () the  (  ) Or  (  )?

@ECHO OFF
CLS
ECHO 1.
ECHO 2.   
ECHO 3. PC

CHOICE /C 123 /M "Enter Your Choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO : PC1   
IF ERRORLEVEL 2 GOTO :1 
IF ERRORLEVEL 1 GOTO :1

:1   
CLS
ECHO 
powershell -Command DRIVELETTER\LOCATIONps1\script.ps1
GOTO :CONTINUE

:1
CLS
ECHO    
powershell -Command DRIVELETTER\LOCATIONps1\  script2.ps1
GOTO :CONTINUE

: PC1
CLS
ECHO   
powershell -Command DRIVELETTER\  LOCATIONps1\script3.ps1
GOTO :CONTINUE



: --->      SETUP
:TWO: 
set 2= ANY NUMBER
GOTO :NEXT2
    : ---> OPTIONS FOR PC IP SETUP
:NEXT2
    ECHO Is This     PC For  (  ) the  () Or  ()?
    
@ECHO OFF
CLS
ECHO 1. ()
ECHO 2. ()  
ECHO 3. PC ()

CHOICE1 /C 123 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO : PC   
IF ERRORLEVEL 2 GOTO : 
IF ERRORLEVEL 1 GOTO :

:  
CLS
ECHO ADDRESS  
powershell -Command   DRIVELETTER\LOCATIONps1\script01.ps1
GOTO :CONTINUE

:   
CLS
ECHO   
powershell -Command DRIVELETTER\LOCATIONps1\script02.ps1
GOTO :CONTINUE

:    PC
CLS
ECHO .212
powershell -Command DRIVELETTER\LOCATIONps1\script03.ps1
GOTO :CONTINUE

: ----> Set IP ADDRS NETWMORK GATEWAY
:CONTINUE

REM ** Get the computer's IP address
for /f "tokens=2* delims=:. " %%a in ('ipconfig ^| find /i "IPv4 Address"') do set ttip=%%b

: ----> OPEN NCPA.CPL
ECHO Check The Configuration


: ----> IP CONFIG CHECK IP

ipconfig | findstr /R /C:"IPv4 Address"

ECHO OFF
ipconfig
ECHO Here are the new settings for %computername%:
netsh int ip show config
ECHO OFF
ncpa.cpl

: ----> EXPORT AS LOG
ECHO Exporting IP Data To The Log IPCONFIG.txt
ipconfig /all > IPCONFIG.txt

