@echo off
setlocal
chcp 65001 >nul
title Agente organizador de Obsidian
py -3.12 "%~dp0agente.py" %*
set "agentExit=%errorlevel%"
echo.
if not "%agentExit%"=="0" echo El agente termino con un error. Revisa el mensaje de arriba.
pause
exit /b %agentExit%