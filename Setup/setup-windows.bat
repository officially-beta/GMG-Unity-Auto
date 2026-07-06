@echo off
setlocal

:: =====================================================
:: GMG-Unity-2025 - Windows Setup Launcher
:: Right-click this file and choose "Run as administrator"
:: =====================================================

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator permissions...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Starting GMG-Unity-2025 setup...
echo.

powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0setup-windows.ps1"
