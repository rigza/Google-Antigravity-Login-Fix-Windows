# Antigravity Login Fix (Windows)

Fixes the Antigravity issue where the app opens but **you cannot log in** :

## Symptoms
- Antigravity launches
- Login fails or never completes
- App may close silently or block login
- Errors appear in console / logs

## Root Cause
Antigravity is an Electron app.

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
✔ Launches Antigravity with a safe user profile  

❗ No permanent system changes are made.

