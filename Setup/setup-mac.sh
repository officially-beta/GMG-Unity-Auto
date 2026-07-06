#!/bin/bash
# =====================================================
# GMG-Unity - Mac Setup Script
# Installs Unity Hub
# =====================================================

set -e

echo "=== GMG-Unity Mac Setup ==="

TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

# --- Check if Unity Hub is already installed ---
if [ -d "/Applications/Unity Hub.app" ]; then
    echo "Unity Hub is already installed. Skipping install."
else
    echo ""
    echo "[1/1] Downloading Unity Hub..."
    DMG_PATH="$TEMP_DIR/UnityHubSetup.dmg"
    curl -L "https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.dmg" -o "$DMG_PATH"

    echo "Mounting Unity Hub disk image..."
    MOUNT_DIR="$TEMP_DIR/mount"
    mkdir -p "$MOUNT_DIR"
    hdiutil attach "$DMG_PATH" -mountpoint "$MOUNT_DIR" -nobrowse -quiet

    echo "Installing Unity Hub to /Applications..."
    cp -R "$MOUNT_DIR/Unity Hub.app" /Applications/

    echo "Ejecting disk image..."
    hdiutil detach "$MOUNT_DIR" -quiet

    echo "Unity Hub installed."
fi

echo ""
echo "=== Setup complete! ==="
echo "Next steps:"
echo "  1. Open Unity Hub (from Applications or Spotlight)"
echo "  2. Sign in with your Unity account"
echo "  3. Click 'Open' and select the 'game' folder from this repo"
echo "  4. Unity Hub will prompt you to install the matching Editor version - let it do so"
echo ""
read -p "Press Enter to exit..."
