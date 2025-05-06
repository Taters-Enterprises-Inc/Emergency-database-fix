@echo off
echo Checking for processes using port 3306...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":3306" ^| find "LISTENING"') do (
    echo Found process using port 3306 with PID: %%a
    echo Terminating process...
    taskkill /PID %%a /F
    echo Process with PID %%a terminated.
)
echo Done.
pause
