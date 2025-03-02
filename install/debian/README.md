# Debian 12 Installation Guide

## Create a new PROXMOX VE Debian 12 Unprivileged 	LXC

[Proxmox VE Helper-Script](https://community-scripts.github.io/ProxmoxVE/scripts?id=debian):

`bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/debian.sh)"`

`bash -c "$(wget -qLO - https://raw.githubusercontent.com/heinemannj/eebus-go-controlbox-simulator-app/main/install/debian/eebus-go-apps.sh)"`

## Setup of fresh installed LXC

`Login` into the new LXC.

`cd /opt`

`sudo apt update && apt upgrade -y`

## Install syslog-ng

`sudo apt install syslog-ng -y`

`sudo systemctl enable --now syslog-ng`

`sudo systemctl daemon-reload`

## Install NodeJS and NPM

`sudo apt install nodejs -y`

`sudo apt install npm -y`

`node -v`

`npm -v`

## Install GO

`wget -q https://golang.org/dl/go1.23.6.linux-amd64.tar.gz`

`rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz`

`nano .profile`

`export PATH=$PATH:/usr/local/go/bin

export GOPATH=$HOME/go

export PATH=$PATH:$GOPATH/bin`

`source ~/.profile`

`go version`

## Install EEBus-Go Apps

`wget -q https://github.com/vollautomat/eebus-go/archive/refs/heads/simulators.zip`

`mv main.zip eebus-go-apps.zip`

`unzip eebus-go-apps.zip`

`cd ./eebus-go-apps/apps/controlbox`

`go run main.go 4713`

-----BEGIN CERTIFICATE-----
MIIBxTCCAWugAwIBAgIRAUOdmAoF86StsXOkRLkhcRwwCgYIKoZIzj0EAwIwQjEL
MAkGA1UEBhMCREUxDTALBgNVBAoTBERlbW8xDTALBgNVBAsTBERlbW8xFTATBgNV
BAMTDERlbW8tVW5pdC0wMTAeFw0yNTAyMTUxNDAzNDFaFw0zNTAyMTMxNDAzNDFa
MEIxCzAJBgNVBAYTAkRFMQ0wCwYDVQQKEwREZW1vMQ0wCwYDVQQLEwREZW1vMRUw
EwYDVQQDEwxEZW1vLVVuaXQtMDEwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARy
0Pwzx9AncwcmW8ZTMGhtgwel0cgjI3SwfnBEztAuIhiswYJbtTKqNzO6Mhw/Un2Y
H7gzHkw697zbKMLFZW5Zo0IwQDAOBgNVHQ8BAf8EBAMCB4AwDwYDVR0TAQH/BAUw
AwEB/zAdBgNVHQ4EFgQUHWKsx487cT388smiLIX+tT1Sb5wwCgYIKoZIzj0EAwID
SAAwRQIhAMT+uEPEL6tjmDCmlD2BqSk9pOl+yZ2gEE7ZSia3iSTuAiAOadZ9/Ft1
KpKp39t6lbs48OZYV4nEmWDDyv283QkLLQ==
-----END CERTIFICATE-----

-----BEGIN EC PRIVATE KEY-----
MHcCAQEEILxrVha9X1/rHV0tzCQoLQn5la+gLcXj9kOPP9on9r/YoAoGCCqGSM49
AwEHoUQDQgAEctD8M8fQJ3MHJlvGUzBobYMHpdHIIyN0sH5wRM7QLiIYrMGCW7Uy
qjczujIcP1J9mB+4Mx5MOve82yjCxWVuWQ==
-----END EC PRIVATE KEY-----
2025-02-15 15:03:41 INFO  Local SKI: 1d62acc78f3b713dfcf2c9a22c85feb53d526f9c



`nano eebus-go-controlbox.crt`

`nano eebus-go-controlbox.key`

`go build`

`make ui`

`make build`

`sudo cp eebus-go-controlbox /usr/local/bin`

`sudo mkdir -p /etc/ssl/localcerts`

`sudo cp eebus-go-controlbox.crt /etc/ssl/localcerts`

`sudo cp eebus-go-controlbox.key /etc/ssl/private`

EVCC:

go run main.go 4713 30787eb7247d335e13bca8eb1bdb828589ef0b24 ./eebus-go-controlbox.crt ./eebus-go-controlbox.key

Vaillant:
go run main.go 4713 e335bfd6fb29800d3884d6eea2370d6f79aaa24b ./eebus-go-controlbox.crt ./eebus-go-controlbox.key







-----BEGIN CERTIFICATE-----
MIIBxTCCAWugAwIBAgIRA7EuGjiIyytTgJo9ji+NPyUwCgYIKoZIzj0EAwIwQjEL
MAkGA1UEBhMCREUxDTALBgNVBAoTBERlbW8xDTALBgNVBAsTBERlbW8xFTATBgNV
BAMTDERlbW8tVW5pdC0wMTAeFw0yNTAyMTYxMDA0NDlaFw0zNTAyMTQxMDA0NDla
MEIxCzAJBgNVBAYTAkRFMQ0wCwYDVQQKEwREZW1vMQ0wCwYDVQQLEwREZW1vMRUw
EwYDVQQDEwxEZW1vLVVuaXQtMDEwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAATE
JToTO3sfF+/Led7e23dfZZDojRffVCry/9lEMcE9t6fA1NxkgkoXOcOn44umBtM5
/bxVtxG6x++5BYDWONTLo0IwQDAOBgNVHQ8BAf8EBAMCB4AwDwYDVR0TAQH/BAUw
AwEB/zAdBgNVHQ4EFgQUzhWjETnMzV22LAnwvO4gjkQIYtEwCgYIKoZIzj0EAwID
SAAwRQIgeHM8INDSdHoW2TkI/vdoOaCQqR/tQGT0YNMiieWFSEcCIQCWIdJElpDE
pcTwqMumQtCvOrKsKc8nHfmply8iBGO1mA==
-----END CERTIFICATE-----

-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIH/M1JxOz9ZIR2pNvdtU2K2ICenF3QxLH5yR2W5Q60k9oAoGCCqGSM49
AwEHoUQDQgAExCU6Ezt7Hxfvy3ne3tt3X2WQ6I0X31Qq8v/ZRDHBPbenwNTcZIJK
FznDp+OLpgbTOf28VbcRusfvuQWA1jjUyw==
-----END EC PRIVATE KEY-----

2025-02-16 11:04:49 INFO  Local SKI: ce15a31139cccd5db62c09f0bcee208e440862d1


go run main.go 4714 1d62acc78f3b713dfcf2c9a22c85feb53d526f9c ./eebus.crt ./eebus.key

## Install HEMS App

go run main.go 4714

-----BEGIN CERTIFICATE-----
MIIBzjCCAXOgAwIBAgIRAqlBDHuv4B2BHmeKRtIg9V0wCgYIKoZIzj0EAwIwRjEL
MAkGA1UEBhMCREUxETAPBgNVBAoTCEVFQlVTLUdPMQ0wCwYDVQQLEwRIRU1TMRUw
EwYDVQQDEwxIRU1TLVVuaXQtMDEwHhcNMjUwMjIzMTMwNTI2WhcNMzUwMjIxMTMw
NTI2WjBGMQswCQYDVQQGEwJERTERMA8GA1UEChMIRUVCVVMtR08xDTALBgNVBAsT
BEhFTVMxFTATBgNVBAMTDEhFTVMtVW5pdC0wMTBZMBMGByqGSM49AgEGCCqGSM49
AwEHA0IABAaHafllvDebZE3upJV7jYX++OyDX5CapzzhquvvDt9vqOMy73yDIabW
cqjTwcwV4BVPDFA0p/FBLjC/HDWZsM2jQjBAMA4GA1UdDwEB/wQEAwIHgDAPBgNV
HRMBAf8EBTADAQH/MB0GA1UdDgQWBBRN2wrNUb8+VE9s9MsJLgZdlkj4yjAKBggq
hkjOPQQDAgNJADBGAiEA6PFlyV1wxaC2gC+UnguWQPCTc5HTqm3GtEeIYiNdrooC
IQD1tM9BQkzh2r90+GeckZL8FdBvBSYiy/riq4mqQfpAjw==
-----END CERTIFICATE-----

-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIEd29sRwOgspimXNUIsYcIaLgrKRQlZ3NqnuCvgtqUPnoAoGCCqGSM49
AwEHoUQDQgAEBodp+WW8N5tkTe6klXuNhf747INfkJqnPOGq6+8O32+o4zLvfIMh
ptZyqNPBzBXgFU8MUDSn8UEuML8cNZmwzQ==
-----END EC PRIVATE KEY-----

2025-02-23 14:05:26 INFO  Local SKI: 4ddb0acd51bf3e544f6cf4cb092e065d9648f8ca

`nano eebus-go-hems.crt`

`nano eebus-go-hems.key`

`go build`

`sudo cp eebus-go-hems /usr/local/bin`

`sudo cp eebus-go-hems.crt /etc/ssl/localcerts`

`sudo cp eebus-go-hems.key /etc/ssl/private`

## Configure systemd

`cp -r /opt/eebus-go-apps/install/debian/systemd/* /usr/lib/systemd/system`

`sudo systemctl daemon-reload`

`sudo systemctl enable --now eebus-go-controlbox_evcc.service`

`sudo systemctl enable --now eebus-go-controlbox_eebus-go-hems.service`

`sudo systemctl enable --now eebus-go-controlbox-app.service`

`sudo systemctl enable --now eebus-go-hems.service`

`sudo systemctl daemon-reload`

`journalctl -f -u eebus-go-controlbox.service`

## Configure syslog-ng

`cp -r /opt/eebus-go-apps/install/debian/syslog-ng/conf.d /etc/syslog-ng`

`systemctl restart syslog-ng.service`
`systemctl status syslog-ng.service`

## Reboot

`reboot`

`sudo systemctl status eebus-go-controlbox.service`

`sudo systemctl status eebus-go-controlbox-app.service`
