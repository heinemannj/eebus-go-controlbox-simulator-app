bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/debian.sh)"

192.168.178.192

adduser <username>
usermod -aG sudo <username>

sudo apt-get update && apt-get upgrade -y

sudo apt install task-gnome-desktop

apt install xrdp -y
systemctl enable --now xrdp

sudo apt install nodejs -y
sudo apt install npm -y

node -v
npm -v


Download 'go' and 'eebus-go-simulators' to /root

wget https://golang.org/dl/go1.23.6.linux-amd64.tar.gz
wget https://github.com/meisel2000/eebus-cbsim/archive/refs/heads/main.zip

wget https://github.com/vollautomat/eebus-go/archive/refs/heads/simulators.zip

mv main.zip eebus-cbsim.zip

rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz


nano .profile

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source ~/.profile

go version

unzip eebus-go-simulators.zip

cd /root/eebus-go-simulators/examples/controlbox

pwd
/root/eebus-go-simulators/examples/controlbox


go run main.go 8181

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



nano eebus.crt

nano eebus.key

go build

EVCC:

go run main.go 8181 30787eb7247d335e13bca8eb1bdb828589ef0b24 ./eebus.crt ./eebus.key

Vaillant:
go run main.go 8181 e335bfd6fb29800d3884d6eea2370d6f79aaa24b /root/eebus-go-simulators/examples/controlbox/eebus.crt /root/eebus-go-simulators/examples/controlbox/eebus.key



journalctl -f -u eebus-controlbox.service



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


apt-get install libpaho-mqtt1.3
apt-get install syslog-ng
systemctl enable --now syslog-ng
systemctl daemon-reload
