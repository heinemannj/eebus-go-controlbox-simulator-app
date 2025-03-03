#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/heinemannj/eebus-go-controlbox-simulator-app/main/install/proxmox/build.func)
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

  $STD apt update -y
  $STD apt upgrade -y
  echo -e 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
  source /etc/profile

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
