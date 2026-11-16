@echo off
cd /d "%~dp0"
set LOG=%~dp0build-commit-log.txt
echo === BUILD RELEASE %DATE% %TIME% === > "%LOG%"
dotnet build "1 - Bot Cripto.csproj" -c Release >> "%LOG%" 2>&1
if errorlevel 1 (echo BUILD FALLITA >> "%LOG%" & echo BUILD FALLITA - vedi build-commit-log.txt & goto fine)
echo BUILD OK >> "%LOG%"
echo === PUBLISH === >> "%LOG%"
dotnet publish "1 - Bot Cripto.csproj" -c Release -f net11.0 -o publish >> "%LOG%" 2>&1
if errorlevel 1 (echo PUBLISH FALLITO >> "%LOG%" & goto fine)
echo PUBLISH OK >> "%LOG%"
echo === GIT === >> "%LOG%"
git add Data/BotDbContext.cs Models/SignalRecord.cs Services/ReportingService.cs Services/BotSchedulerService.cs crea-tabella-trades.sql crea-tabella-trades.ps1 crea-tabella-trades.cmd crea-tabella-signals.sql crea-tabella-signals.ps1 crea-tabella-signals.cmd crea-tabella-cycles.sql crea-tabella-cycles.ps1 crea-tabella-cycles.cmd aggiungi-colonna-bot.sql aggiungi-colonna-bot.ps1 aggiungi-colonna-bot.cmd
git commit -F commit-msg.txt >> "%LOG%" 2>&1
if errorlevel 1 (echo COMMIT FALLITO >> "%LOG%" & goto fine)
git push origin main >> "%LOG%" 2>&1
if errorlevel 1 (echo PUSH FALLITO >> "%LOG%") else (echo PUSH OK >> "%LOG%")
:fine
echo FINE >> "%LOG%"
type "%LOG%"
timeout /t 10
