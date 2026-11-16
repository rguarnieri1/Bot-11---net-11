@echo off
cd /d "%~dp0"
set LOG=%~dp0git-sync-log.txt
echo === GIT SYNC %DATE% %TIME% === > "%LOG%"
git fetch origin >> "%LOG%" 2>&1
git reset --soft origin/main >> "%LOG%" 2>&1
git log --oneline -3 >> "%LOG%" 2>&1
git status -sb >> "%LOG%" 2>&1
echo FINE >> "%LOG%"
