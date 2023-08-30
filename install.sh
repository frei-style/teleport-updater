#!/usr/bin/env bash

# Navigate to the script's directory
cd "$(readlink -f "$(dirname "${0}")")"

# Check if files exist before copying
if [[ -f /usr/local/bin/teleport-updater || -f /etc/systemd/system/teleport-updater.service || -f /etc/systemd/system/teleport-updater.timer ]]; then
    read -p "Existing configurations detected. Overwrite? (y/N): " choice
    case "$choice" in
        y|Y ) echo "Overwriting...";;
        * ) echo "Installation aborted."; exit 1;;
    esac
fi

# Copy files
cp teleport-updater /usr/local/bin/
cp teleport-updater.service /etc/systemd/system/
cp teleport-updater.timer /etc/systemd/system/

# Reload systemd and start the timer
systemctl daemon-reload
systemctl enable teleport-updater.timer
systemctl start teleport-updater.timer
