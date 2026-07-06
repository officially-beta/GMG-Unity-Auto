# =====================================================
# GMG-Unity-2025 - Windows Setup Script
# Installs Visual C++ Redistributable + Unity Hub
# =====================================================

Write-Host "=== GMG-Unity-2025 Windows Setup ===" -ForegroundColor Cyan

# Must run as Administrator
# NOTE: if you're running this directly (rather than via setup-windows.bat),
# this will relaunch itself elevated in a NEW window and close this one -
# that's expected. The new window will stay open with -NoExit.
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "This script needs to run as Administrator. Restarting with elevated permissions..." -ForegroundColor Yellow
    Start-Process powershell -Verb RunAs -ArgumentList "-NoExit -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

$tempDir = "$env:TEMP\gmg-unity-setup"
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

# --- Step 1: Visual C++ Redistributable ---
Write-Host "`n[1/2] Installing Visual C++ Redistributable..." -ForegroundColor Cyan
$vcPath = "$tempDir\vc_redist.x64.exe"
try {
    Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile $vcPath -UseBasicParsing
    Start-Process -FilePath $vcPath -ArgumentList "/install /quiet /norestart" -Wait
    Write-Host "Visual C++ Redistributable installed." -ForegroundColor Green
} catch {
    Write-Host "Failed to install Visual C++ Redistributable: $_" -ForegroundColor Red
}

# --- Step 2: Unity Hub ---
Write-Host "`n[2/2] Checking for Unity Hub..." -ForegroundColor Cyan

$hubInstallPaths = @(
    "$env:ProgramFiles\Unity Hub\Unity Hub.exe",
    "${env:ProgramFiles(x86)}\Unity Hub\Unity Hub.exe"
)
$hubAlreadyInstalled = $hubInstallPaths | Where-Object { Test-Path $_ }

if ($hubAlreadyInstalled) {
    Write-Host "Unity Hub is already installed. Skipping install." -ForegroundColor Green
} else {
    Write-Host "Installing Unity Hub..." -ForegroundColor Cyan
    $hubPath = "$tempDir\UnityHubSetup.exe"
    try {
        Invoke-WebRequest -Uri "https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe" -OutFile $hubPath -UseBasicParsing
        Start-Process -FilePath $hubPath -ArgumentList "/S" -Wait
        Write-Host "Unity Hub installed." -ForegroundColor Green
    } catch {
        Write-Host "Failed to install Unity Hub: $_" -ForegroundColor Red
    }
}

# --- Cleanup ---
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`n=== Setup complete! ===" -ForegroundColor Green
Write-Host "Next steps:"
Write-Host "  1. Open Unity Hub"
Write-Host "  2. Sign in with your Unity account"
Write-Host "  3. Click 'Open' and select the '/game' folder from this repo"
Write-Host "  4. Unity Hub will prompt you to install the matching Editor version - let it do so"

Read-Host "`nPress Enter to exit"
