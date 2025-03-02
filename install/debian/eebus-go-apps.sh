#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/build.func)
# Copyright (c) 2025 Joerg Heinemann
# Author: heinemannj66@gmail.com
# License: MIT | https://github.com/heinemannj/eebus-go-controlbox-simulator-app/raw/main/LICENSE
# Source: https://github.com/heinemannj/eebus-go-controlbox-simulator-app

APP="eebus-go-apps"
var_tags="eebus;hems;automation"
var_cpu="1"
var_ram="1024"
var_disk="16"
var_os="debian"
var_version="12"
var_unprivileged="1"

header_info "$APP"
variables
color
catch_errors

function update_script() {
  header_info
  check_container_storage
  check_container_resources
  #  if [[ ! -f /etc/apt/sources.list.d/evcc-stable.list ]]; then
  #    msg_error "No ${APP} Installation Found!"
  #    exit
  #  fi
  msg_info "Updating eebus-go-apps LXC"

  ##$STD cd /opt

  ##$STD apt update -y
  ##$STD apt upgrade -y

  # Install syslog-ng
  ##$STD apt install syslog-ng -y
  # $STD systemctl daemon-reload
  # $STD systemctl enable --now syslog-ng

  # Install NodeJS and NPM
  ##$STD apt install nodejs -y
  ##$STD apt install npm -y

  # Install GO
  ##$STD wget -q https://golang.org/dl/go1.23.6.linux-amd64.tar.gz
  ##$STD rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz
  ##$STD rm -rf /opt/go1.23.6.linux-amd64.tar.gz

  # `nano .profile`
  # `export PATH=$PATH:/usr/local/go/bin
  #
  # export GOPATH=$HOME/go
  # export PATH=$PATH:$GOPATH/bin`
  #
  #`source ~/.profile`

  # Install EEBUS-Go Apps
  ##$STD wget -q https://github.com/heinemannj/eebus-go-controlbox-simulator-app/archive/refs/heads/main.zip
  ##$STD mv eebus-go-controlbox-simulator-app-main.zip eebus-go-apps.zip
  ##$STD unzip eebus-go-apps.zip

  # Configure systemd
  ##$STD cp -r /opt/eebus-go-apps/install/debian/systemd/* /usr/lib/systemd/system
  #$STD systemctl daemon-reload
  #$STD systemctl enable --now eebus-go-controlbox_evcc.service
  #$STD systemctl enable --now eebus-go-controlbox_eebus-go-hems.service
  #$STD systemctl enable --now eebus-go-controlbox-app.service
  #$STD systemctl enable --now eebus-go-hems.service
  #$STD systemctl daemon-reload

  # Configure syslog-ng
  ##$STD cp -r /opt/eebus-go-apps/install/debian/syslog-ng/conf.d /etc/syslog-ng

  msg_ok "Updated Successfully"
  exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}:7712${CL}"
