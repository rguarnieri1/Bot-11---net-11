@echo off
cd /d "%~dp0"
set LOG=%~dp0commit-docs-log.txt
echo === GIT %DATE% %TIME% === > "%LOG%"
git fetch origin >> "%LOG%" 2>&1
git status -sb >> "%LOG%" 2>&1
git add config.json Documentation.md >> "%LOG%" 2>&1
git commit -F commit-msg.txt >> "%LOG%" 2>&1
if errorlevel 1 (echo COMMIT FALLITO >> "%LOG%" & goto fine)
git push origin main >> "%LOG%" 2>&1
if errorlevel 1 (echo PUSH FALLITO >> "%LOG%") else (echo PUSH OK >> "%LOG%")
:fine
echo FINE >> "%LOG%"
