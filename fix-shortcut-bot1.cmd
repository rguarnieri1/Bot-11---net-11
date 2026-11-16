@echo off
set LOG=%~dp0fix-shortcut-log.txt
powershell -NoProfile -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('C:\Users\Pc\OneDrive\Desktop\Bots\1 - Bot Cripto.exe - collegamento.lnk'); $s.TargetPath='C:\Users\Pc\OneDrive\Bot\1 - Bot Cripto - net11\bin\Release\net11.0\1 - Bot Cripto.exe'; $s.WorkingDirectory='C:\Users\Pc\OneDrive\Bot\1 - Bot Cripto - net11\bin\Release\net11.0'; $s.Save(); 'OK ' + $s.TargetPath" > "%LOG%" 2>&1
echo FINE >> "%LOG%"
