@Echo off

REM Set the title of the console window
TITLE xSilEz TWEAK [ Ultimate Cleanup ]

REM Set the size of the console window
mode con: cols=100 lines=30

REM Set the text color to blue on black
COLOR 1

REM Display a logo for the script
echo     ________  ____     ____  ____  ________  ______
echo    
echo  xSilEz TWEAK    
echo  xSilEz TEAM
echo discord.gg/tQmKMBWERM
echo __________________________________________________

REM Delete temporary files from the C:\Windows\Temp directory
@echo DELETING TEMP FILES
set folder="C:\Windows\Temp"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
cls

REM Delete temporary files from the user's local AppData\Temp directory
set folder="%userprofile%\AppData\Local\Temp"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
cls

REM Use the Disk Cleanup tool to automatically clean up various types of files
@echo AUTOMATIC DISK CLEANUP
set R_Key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches
reg add "%R_Key%\Active Setup Temp Folders" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Thumbnail Cache" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Delivery Optimization Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\D3D Shader Cache" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Downloaded Program Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Internet Cache Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Setup Log Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Temporary Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Windows Error Reporting Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Offline Pages Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
cleanmgr.exe /sagerun:11

REM Exit the script
exit