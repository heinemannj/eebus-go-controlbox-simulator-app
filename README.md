# eebus-go controlbox simulator app

[![Build Status](https://github.com/enbility/eebus-go/actions/workflows/default.yml/badge.svg?branch=dev)](https://github.com/enbility/eebus-go/actions/workflows/default.yml/badge.svg?branch=dev)
[![GoDoc](https://img.shields.io/badge/godoc-reference-5272B4)](https://godoc.org/github.com/enbility/eebus-go)
[![Coverage Status](https://coveralls.io/repos/github/enbility/eebus-go/badge.svg?branch=dev)](https://coveralls.io/github/enbility/eebus-go?branch=dev)
[![Go report](https://goreportcard.com/badge/github.com/enbility/eebus-go)](https://goreportcard.com/report/github.com/enbility/eebus-go)
[![CodeFactor](https://www.codefactor.io/repository/github/enbility/eebus-go/badge)](https://www.codefactor.io/repository/github/enbility/eebus-go)

This eebus-go controlbox simulator app provides a foundation for implementing [EEBUS](https://eebus.org) use cases in [go](https://golang.org). It uses the [eebus-go](https://github.com/enbility/eebus-go) library, the SHIP implementation [ship-go](https://github.com/enbility/ship-go) and the SPINE implementation [spine-go](https://github.com/enbility/spine-go).
Basic understanding of the EEBUS concepts SHIP and SPINE to use this library is required. Please check the corresponding specifications on the [EEBUS downloads website](https://www.eebus.org/media-downloads/).

## Introduction

The supported functionality contains:

- Support for SHIP 1.0.1 via [ship-go](https://github.com/enbility/ship-go)
- Support for SPINE 1.3.0 via [spine-go](https://github.com/enbility/spine-go)
- Certificate handling
- mDNS Support, incl. avahi support
- Connection (websocket) handling, including reconnection and double connections
- Support for handling pairing of devices

Via the usage of [eebus-go](https://github.com/enbility/eebus-go) library:

- `api`: global API interface definitions and eebus service configuration
- `features/client`: provides feature helpers with the local SPINE feature having the client role and the remote SPINE feature being the server for easy access to commonly used functions
- `features/server`: provides feature helpers with the local SPINE feature having the server role for easy access to commonly used functions
- `service`: central package which provides access to SHIP and SPINE. Use this to create the EEBUS service, its configuration and connect to remote EEBUS services
- `usecases`: containing actor and use case based implementations with use case scenario based APIs and events

## Simulator App and Web Frontend

Example code for sending an LPC and LPP limit 5 seconds after connecting to a compatible device that can receive LPC and LPP limits and a user friendly Web UI to manually simulate consumption and production power limitation requests.

![Frontend](docs/pictures/frontend.png)

## Notes

This eebus-go controlbox simulator example do **not** provide complete implementations of any use case, but is intended as usage guidelines for the eebus-go stack in general and to have a quick demo.

Used [server ports](docs/server-ports.md) for various eebus related parts.

## First Steps

- Download and install [golang](https://go.dev/) for your computer
- Download and install (NodeJS and NPM)[https://nodejs.org/] if you do not already have it
- Download the source code of this repository
- Run npm install inside the root repository folder
- Now follow either the `Development` or `Build binary` steps

For a Linux setup follow this [debian installation guide](docs/debian-installation-guide.md).

## Development

### Running the server component

- `make ui` for creating the UI assets
- `go run main.go -h` to see all the possible parameters.
- `go run main.go` to start with the default parameters.

### Running the web frontend

`npx vite dev` to start with the default parameters using `vite.config.js`.
The web service is now accessible at `http://localhost:7051/`

## Build binary

- `make ui` for creating the UI assets
- `make build` for building the binary for the local system
- execute the binary with `./devices-ap`
- Open the website in a browser at `http://localhost:7050/`

## First Run

```sh
go run main.go 4713
```

`4713` is the example server port that this process should listen on

The certificate and key and the local SKI will be generated and printed. You should then save the certificate and the key to a file.

## General Usage

```sh
Usage: go run main.go <serverport> <remoteski> <certfile> <keyfile>
```

- `remoteski` is the SKI of the remote device or service you want to connect to
- `certfile` is a local file containing the generated certificate in the first usage run
- `keyfile` is a local file containing the generated key in the first usage run

If no certfile or keyfile are provided, they are generated and printed in the console so they can be saved in a file and later used again. The local SKI is also printed.

## Example Configurations with different HEMS implementations

### Controlbox -> EVCC

#### Add EEBus configuration to EVCC 
Create EEBus cert for evcc

```
evcc eebus-cert
[main  ] INFO 2025/02/07 20:13:11 evcc 0.132.1

Add the following to the evcc config file:

eebus:
  certificate:
    public: |
      -----BEGIN CERTIFICATE-----
      MIIBvTCCAWOgAwIBAgIRAKY6cWkJteXQqgLp4
      ...
      M8YGKSd8dlVtyZQu1vM7VmI=
      -----END CERTIFICATE-----
      
    private: |
      -----BEGIN EC PRIVATE KEY-----
      MHcCAQEEIByJ00M/FMKBrVH8MnCwEXS/
      ...
      -----END EC PRIVATE KEY-----
      
```

#### Controlbox
Generate eebus.crt + eebus.key
Store certificate from output in eebus.crt file
Store private key from output in eebus.key file
Grep local SKI from output

Example:
```
go run main.go 4713 

-----BEGIN CERTIFICATE-----
MIIBxjCCAWugAwIBAgIRA2NclvXFEqMvKE/KA28Ile0wCgYIKoZIzj0EAwIwQjEL
...
Hh6SOdAT67JcsBfH10lpEc0kG4zWlxF/d5Q=
-----END CERTIFICATE-----

-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIIskfvH2vllGa/EIWphJ
...
RkpQ7/vTklMxk+sYzXwRzw==
-----END EC PRIVATE KEY-----

2025-02-07 20:41:54 INFO  Local SKI: c6bdd44deab084c9e73e1eceecbea33425ed3b7d
```

#### Start evcc

Add hems with SKI of controllbox to evcc.yaml
```
hems:
  type: eebus
  ski: <ski of controlbox>
```

Example:
```
hems:
  type: eebus
  # ski: <ski of controlbox>
  ski: c6bdd44deab084c9e73e1eceecbea33425ed3b7d

```

Restart evcc and grep log for local ski
```
[eebus ] INFO 2025/02/07 20:05:56 Local SKI: 1e238613c409407420e5bfa97955309eeb62876c
```

#### Start Controlbox simulator

Start controlbox simulator
`go run main <port> <evcc ski> <crtfile> <keyfile>`

Example:
```
go run main.go 4713 1e238613c409407420e5bfa97955309eeb62876c eebus.crt eebus.key
```

### Install Controlbox frontend

```
npm install
```

### Start Controlbox frontend 
```
npm run dev
```
