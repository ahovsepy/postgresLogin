@echo off

if [%4]==[] goto usage
goto :sqlcmd
:usage
@echo Usage: %0 [server] [user] [password] count]
exit /B 1


:sqlcmd
SET server=%1
SET user=%2
SET pass=%3
SET count=%4

:loop
start sqlcmd -S %server% -U %user% -P %pass% -Q
ping 127.0.0.1 -n 0.3 > null

set /a count-=1
if %count% GTR 0 goto loop
