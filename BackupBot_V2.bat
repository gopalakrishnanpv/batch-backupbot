setlocal enabledelayedexpansion
@echo off
Title __ BACKUPBOT_V-1.0 - DEBENHAMS
:START
@Echo off
cls
color 3
Echo.
Echo ******** BACKUP CREATOR  **********
Echo.
:FOLDER
SET /P FOLDER=PLEASE ENTER FOLDER NAME (EG. BACKUP): 
echo.
IF {%FOLDER%}== {} GOTO FOLDER
IF NOT EXIST %FOLDER% ( Echo PATH %FOLDER% DOESNT EXIST. TRYING TO CREATE %FOLDER%....
mkDIR %FOLDER% )
echo.
IF NOT EXIST %FOLDER% ( Echo ERROR WHILE CREATING %FOLDER% !! PROCESS TERMINATING..
GOTO REPEAT)
cd %FOLDER%

:SERVER
SET /P SERVER=PLEASE SELECT ONE OR ALL SERVERS ( EG: 12, 13, 41, 01, ALL ): 
echo.
IF !SERVER! == {} GOTO SERVER
IF !SERVER! == 12 GOTO BHTW8K12
IF !SERVER! == 13 GOTO BHTW8K13
IF !SERVER! == 41 GOTO BHTW8K41
IF !SERVER! == 01 GOTO BHTW8K01
IF !SERVER! == ALL GOTO BHTW8K12
Echo 
Echo INVALID INPUT.. PLEASE TRY AGAIN ..
GOTO SERVER

:BHTW8K12
mkDIR BHTW8K12
for %%a in (\\bhtw8k12\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%%~ta 
for %%a in (\\bhtw8k12\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%FileDate:~0,9%
set ExtractDate=%FileDate:~3,2%/%FileDate:~0,2%/20%FileDate:~6,4%
xcopy \\bhtw8k12\c$\rcs\ncr\apps\extract BHTW8K12  /D:%ExtractDate% 
set CFeed=890%FileDate:~0,2%%FileDate:~3,2%CFEED.Z
xcopy \\bhtw8k12\c$\rcs\rbs\xmit_central\%CFeed% BHTW8K12\%CFeed%*
IF NOT !SERVER! == ALL GOTO CHOICE

:BHTW8K13
mkDIR BHTW8K13
for %%a in (\\bhtw8k13\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%%~ta 
for %%a in (\\bhtw8k13\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%FileDate:~0,9%
set ExtractDate=%FileDate:~3,2%/%FileDate:~0,2%/20%FileDate:~6,4%
xcopy \\bhtw8k13\c$\rcs\ncr\apps\extract BHTW8K13  /D:%ExtractDate% 
set CFeed=891%FileDate:~0,2%%FileDate:~3,2%CFEED.Z
xcopy \\bhtw8k13\c$\rcs\rbs\xmit_central\%CFeed% BHTW8K13\%CFeed%*
IF NOT !SERVER! == ALL GOTO CHOICE

:BHTW8K41
mkDIR BHTW8K41
for %%a in (\\bhtw8k41\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%%~ta 
for %%a in (\\bhtw8k41\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%FileDate:~0,9%
set ExtractDate=%FileDate:~3,2%/%FileDate:~0,2%/20%FileDate:~6,4%
xcopy \\bhtw8k41\c$\rcs\ncr\apps\extract BHTW8K41  /D:%ExtractDate% 
set CFeed=964%FileDate:~0,2%%FileDate:~3,2%CFEED.Z
xcopy \\bhtw8k41\c$\rcs\rbs\xmit_central\%CFeed% BHTW8K41\%CFeed%*
IF NOT !SERVER! == ALL GOTO CHOICE

:BHTW8K01
mkDIR BHTW8K01
for %%a in (\\bhtw8k01\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%%~ta 
for %%a in (\\bhtw8k01\c$\rcs\ncr\apps\extract\debsext) do set FileDate=%FileDate:~0,9%
set ExtractDate=%FileDate:~3,2%/%FileDate:~0,2%/20%FileDate:~6,4%
xcopy \\bhtw8k01\c$\rcs\ncr\apps\extract BHTW8K01  /D:%ExtractDate%  
set CFeed=963%FileDate:~0,2%%FileDate:~3,2%CFEED.Z
xcopy \\bhtw8k01\c$\rcs\rbs\xmit_central\%CFeed% BHTW8K01\%CFeed%*
IF NOT !SERVER! == ALL GOTO CHOICE
GOTO RESULTS

:CHOICE
SET /P CHOICE = DO YOU WANT TO BACKUP FOR ANY OTHER SERVER (Y/N): 
IF !CHOICE! == Y GOTO OPTIONS
IF !CHOICE! == y GOTO OPTIONS
IF !CHOICE! == N GOTO RESULTS
IF !CHOICE! == n GOTO RESULTS
GOTO CHOICE

:OPTIONS
SET /P OPTIONS = SELECT ANY ONE SERVER ( EG: 12, 13, 41, 01 ): 
IF !OPTIONS! == 12 GOTO BHTW8K12
IF !OPTIONS! == 13 GOTO BHTW8K13
IF !OPTIONS! == 41 GOTO BHTW8K41
IF !OPTIONS! == 01 GOTO BHTW8K01


:RESULTS
Echo.
Echo ************************************
Echo Backup Completed For the Below Files
Echo ************************************
Echo.
cd BHTW8K12
dir /s /b /o:gn
cd ..
Echo.
cd BHTW8K13
dir /s /b /o:gn
cd ..
Echo.
cd BHTW8K41
dir /s /b /o:gn
cd ..
Echo.
cd BHTW8K01
dir /s /b /o:gn
cd ..
cd ..
Echo.
pause
START %FOLDER%
Echo.
exit
:REPEAT
Echo.
SET /P inp=ENTER "Y" TO START AGAIN OR ANY OTHER KEY TO EXIT. CONTINUE(Y/N)? 
IF %inp% == Y GOTO START
IF %inp% == y GOTO START
exit