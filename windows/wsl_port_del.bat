@echo off
for /f "delims=" %%a in ('wsl hostname -I') do set wsl_ip=%%a
echo wsl ip: %wsl_ip%

netsh interface portproxy delete v4tov4 listenaddress=127.0.0.1 listenport=30300
netsh interface portproxy delete v4tov4 listenaddress=127.0.0.1 listenport=30301

netsh interface portproxy show all
pause
