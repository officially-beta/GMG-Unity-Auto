# GMG-Unity-2025

## Getting Started

Follow the instructions below for your operating system. This will install everything you need to open and run the project in Unity Hub.

---

### Windows

1. Download this repository (Code → Download ZIP, or `git clone`)
2. Open the `setup` folder
3. Right-click **`setup-windows.ps1`** → **Run with PowerShell**
   - If Windows asks for permission (UAC prompt), click **Yes** — the script needs admin rights to install software
   - If PowerShell blocks the script with an "execution policy" message, right-click the file → **Properties** → check **Unblock** at the bottom → Apply, then try again
4. Wait for the script to finish (installs Visual C++ Redistributable + Unity Hub)
5. Open **Unity Hub**, sign in, click **Open**, and select the **`game`** folder from this repo
6. Unity Hub will detect the required Editor version and prompt you to install it — let it do so

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

**Unity Hub flashes open then closes immediately (Windows):**
This is almost always fixed by the Visual C++ Redistributable installed in `setup-windows.ps1`. If it still happens:
1. Uninstall Unity Hub (Settings → Apps)
2. Delete these folders if they exist: `%appdata%\UnityHub`, `%localappdata%\UnityHub`
3. Restart your PC
4. Re-run `setup-windows.ps1`

**Script won't run / "not digitally signed" or execution policy errors (Windows):**
Right-click the script → Properties → check "Unblock" → Apply. Then run it again.

**"Cannot be opened because it is from an unidentified developer" (Mac):**
Right-click `setup-mac.sh` → Open, then confirm. Or run `xattr -d com.apple.quarantine setup-mac.sh` in Terminal first.

---

## Project Structure

```
/game/     → Unity project (open this folder in Unity Hub)
/setup/    → Setup scripts for Windows and Mac
readme.md  → This file
```
