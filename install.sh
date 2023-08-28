#!/usr/bin/env bash
cd "$(readlink -f "$(dirname "${0}")")"

cp teleport-updater /usr/local/bin/
cp teleport-updater.service /etc/systemd/system/
cp teleport-updater.timer /etc/systemd/system/

systemctl daemon-reload
systemctl enable teleport-updater.timer
systemctl start teleport-updater.timer
