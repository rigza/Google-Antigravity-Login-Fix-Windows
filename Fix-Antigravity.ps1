# =========================================================
# Antigravity automatic fix script
# - Automatically detects current Windows user
# - Fixes TEMP / TMP / APPDATA issues
# - Kills stale Antigravity processes
# - Launches Antigravity safely
# =========================================================

$USER = $env:USERNAME
$USERPROFILE = $env:USERPROFILE

Write-Host "Running as user: $USER"

# ---------------------------------------------------------
# Step 1: Kill any running Antigravity instances (mutex fix)
# ---------------------------------------------------------
Write-Host "Stopping Antigravity processes..."
Get-Process -Name "Antigravity" -ErrorAction SilentlyContinue | Stop-Process -Force

# ---------------------------------------------------------
# Step 2: Ensure C:\Temp exists
# ---------------------------------------------------------
Write-Host "Ensuring C:\Temp exists..."
New-Item -ItemType Directory -Path "C:\Temp" -Force | Out-Null

# ---------------------------------------------------------
# Step 3: Fix environment variables (session only)
# ---------------------------------------------------------
Write-Host "Fixing environment variables..."
$env:TEMP = "C:\Temp"
$env:TMP = "C:\Temp"
$env:APPDATA = "$USERPROFILE\AppData\Roaming"
$env:LOCALAPPDATA = "$USERPROFILE\AppData\Local"

# ---------------------------------------------------------
# Step 4: Change directory to Antigravity install path
# ---------------------------------------------------------
$ANTIGRAVITY_PATH = "$USERPROFILE\AppData\Local\Programs\Antigravity"
Write-Host "Changing directory to $ANTIGRAVITY_PATH"
Set-Location $ANTIGRAVITY_PATH



