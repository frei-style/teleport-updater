# Teleport Updater

This script is designed to perform a nightly update of [Gravitational Teleport](https://goteleport.com/) (OpenSource).

## Requirements

- A Debian or RHEL based system
- `apt` or `dnf` installed
- `dnf`: Teleport is installed from a repository named teleport
- `apt`: Teleport is installed from a repository defined in `/etc/apt/sources.list.d/teleport.list`

## Install

The installation can be performed with two commands.
```
git clone https://github.com/frei-style/teleport-updater.git
sudo bash teleport-updater/install.sh
```

This will perform the following actions:
- Install the update script to `/usr/local/bin/teleport-updater`
- Install a service unit, to call the update script to `/etc/systemd/system/teleport-updater.service`
- Install a timer unit, to trigger the update daily at 04:30, to `/etc/systemd/system/teleport-updater.timer`
- Enable and activate the timer

## Disclaimer

There are no security checks or roll-back function. Do not use it in production. It's meant to be used in lab or home environments.
