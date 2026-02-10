# Google Antigravity Login Fix (Windows)

Fixes Google Antigravity issue where the app opens but **you cannot log in** :

## Symptoms
- Antigravity launches
- Login fails or never completes
- App may close silently or block login
- Errors appear in console / logs

## Root Cause
Google Antigravity is an Electron app.

If Windows environment variables such as:
- TEMP
- TMP
- APPDATA
- LOCALAPPDATA

are broken, missing, or unwritable, Electron fails during **startup login initialization**, preventing authentication.

## What this script does
✔ Stops stale Antigravity background processes  
✔ Restores valid TEMP / TMP / APPDATA paths (session-only)  
✔ Creates a clean temporary directory  
 
❗ No permanent system changes are made.


## How to use (PowerShell)

1. Download the zip file
2. Right-click `fix-antigravity.ps1`
3. Click **Run with PowerShell**

If PowerShell blocks execution:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\fix-antigravity.ps1
```

## How to use (Batch)

Double-click:

```bat
fix-antigravity.bat
```
