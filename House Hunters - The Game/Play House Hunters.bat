@echo off
title House Hunters - The Game
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js was not found, so the game will open straight from the file instead.
  echo Everything works that way, but installing Node.js from https://nodejs.org is smoother.
  start "" "%~dp0index.html"
  pause
  exit /b
)
node server.js --open
pause
