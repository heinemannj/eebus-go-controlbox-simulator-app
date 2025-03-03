# Installation Guide

## Linux OS and eebus-go-apps related dependencies

### New PROXMOX VE Debian 12 Unprivileged LXC

[Create a new Debian 12 Unprivileged LXC](./proxmox/README.md)

### Use existing Debian 12 system

[Install manually on an existing Debian system](./debian/README.md)

## Post installation tasks

### Check installed dependencies

- `sudo systemctl status syslog-ng`
- `node -v`
- `npm -v`
- `go version`

