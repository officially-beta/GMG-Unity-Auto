# GMG-Unity

## Getting Started

Follow the instructions below for your operating system. This will install everything you need to open and run the project in Unity Hub.

---

### Windows

1. Download this repository (Code → Download ZIP, or `git clone`)
2. Open the `setup` folder
3. Right-click **`setup-windows.bat`** → **Run as administrator**
   - A UAC prompt will appear — click **Yes**
   - A terminal window will open and stay open, showing progress
4. Wait for the script to finish (installs Visual C++ Redistributable + Unity Hub, skipping anything already installed)
5. Press **Enter** to close the terminal when done
6. Open **Unity Hub**, sign in, click **Open**, and select the **`game`** folder from this repo
7. Unity Hub will detect the required Editor version and prompt you to install it — let it do so

> Note: run `setup-windows.bat`, not `setup-windows.ps1` directly. The `.bat` file is what handles the admin prompt properly and keeps the window open so you can see what's happening.

---

### Mac

1. Download this repository (Code → Download ZIP, or `git clone`)
2. Open **Terminal**
3. Navigate to the `setup` folder, for example:
   ```
   cd ~/Downloads/GMG-Unity-2025/setup
   ```
4. Make the script executable and run it:
   ```
   chmod +x setup-mac.sh
   ./setup-mac.sh
   ```
5. Open **Unity Hub** (Applications or Spotlight search), sign in, click **Open**, and select the **`game`** folder from this repo
6. Unity Hub will detect the required Editor version and prompt you to install it — let it do so

---

## Troubleshooting

**Antivirus blocks the script from running:**
Some antivirus software (including Windows Defender SmartScreen, or third-party antivirus) may flag the setup script simply because it's a script downloading and installing other software — this is a false positive, not an actual threat. If this happens:
1. Check your antivirus's notification/quarantine area for a blocked item related to `setup-windows.bat` or `setup-windows.ps1`
2. Choose **Allow**, **Restore**, or **Run anyway** (wording varies by antivirus)
3. If using Windows Defender specifically: Windows Security → Virus & threat protection → Protection history → find the entry → **Allow**
4. Re-run the script

**Unity Hub flashes open then closes immediately (Windows):**
This is almost always fixed by the Visual C++ Redistributable installed in `setup-windows.ps1`. If it still happens:
1. Uninstall Unity Hub (Settings → Apps)
2. Delete these folders if they exist: `%appdata%\UnityHub`, `%localappdata%\UnityHub`
3. Restart your PC
4. Re-run `setup-windows.ps1`

**Terminal window flashes and closes immediately (Windows):**
Make sure you're running `setup-windows.bat`, not `setup-windows.ps1` directly. Right-clicking a `.ps1` file only offers "Run with PowerShell" (no admin option), which causes it to relaunch itself elevated in a second window and close the first — that's the flash you're seeing. The `.bat` file avoids this by requesting admin rights properly up front.

**Script won't run / "not digitally signed" or execution policy errors (Windows):**
Right-click the file → Properties → check "Unblock" at the bottom → Apply. Then run it again.

**"Cannot be opened because it is from an unidentified developer" (Mac):**
Right-click `setup-mac.sh` → Open, then confirm. Or run `xattr -d com.apple.quarantine setup-mac.sh` in Terminal first.

---

## Project Structure

```
/game/     → Unity project (open this folder in Unity Hub)
/setup/    → Setup scripts for Windows and Mac
readme.md  → This file
```
