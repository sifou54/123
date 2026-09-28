@echo off
color a
title Paragon Cache Cleaner

call :checkPermissions
call :paragonLogo
echo Press any key to clean cache...
pause > nul
cls

rd /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP

for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

cls
call :paragonLogo
echo Logs and Cache have been Deleted!
echo.
echo Press any key to exit...
pause > nul
exit

:checkPermissions
fsutil dirty query %systemdrive% >nul
if %errorLevel% NEQ 0 (
	echo Try again as Administrator.
	echo.
	echo Press any key to exit...
	pause > nul
	exit
)
exit /b

:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof

:paragonLogo
echo 8888888b.
echo 888   Y88b
echo 888    888
echo 888   d88P 8888b.  888d888 8888b.   .d88b.   .d88b.  88888b.
echo 8888888P"     "88b 888P"      "88b d88P"88b d88""88b 888 "88b
echo 888       .d888888 888    .d888888 888  888 888  888 888  888
echo 888       888  888 888    888  888 Y88b 888 Y88..88P 888  888
echo 888       "Y888888 888    "Y888888  "Y88888  "Y88P"  888  888
echo                                         888
echo                                    Y8b d88P
echo                                     "Y88P"
echo        .d8888b.                    888
echo       d88P  Y88b                   888
echo       888    888                   888
echo       888         8888b.   .d8888b 88888b.   .d88b.
echo       888            "88b d88P"    888 "88b d8P  Y8b
echo       888    888 .d888888 888      888  888 88888888
echo       Y88b  d88P 888  888 Y88b.    888  888 Y8b.
echo        "Y8888P"  "Y888888  "Y8888P 888  888  "Y8888
echo.
echo.
exit /b