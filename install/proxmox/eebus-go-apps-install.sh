#!/usr/bin/env bash

# Copyright (c) 2025 Joerg Heinemann
# Author: heinemannj66@gmail.com
# License: MIT | https://github.com/heinemannj/eebus-go-controlbox-simulator-app/raw/main/LICENSE
# Source: https://github.com/heinemannj/eebus-go-controlbox-simulator-app

source /dev/stdin <<< "$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Dependencies"
$STD apt-get install -y \
  curl \
  wget \
  unzip \
  nodejs \
  npm \
  sudo \
  mc \
  lsb-release \
  gpg 
msg_ok "Installed Dependencies"

$STD cd /opt

msg_info "Installing syslog-ng"
$STD apt install -y syslog-ng
systemctl daemon-reload -q
systemctl enable -q --now syslog-ng.service
msg_ok "Installed syslog-ng"

msg_info "Installing GO"
wget -q https://golang.org/dl/go1.23.6.linux-amd64.tar.gz
$STD rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz
$STD rm -rf /opt/go1.23.6.linux-amd64.tar.gz
msg_ok "Installed GO"

msg_info "Installing eebus-go-apps"
wget -q https://github.com/heinemannj/eebus-go-controlbox-simulator-app/archive/refs/heads/main.zip
$STD mv main.zip eebus-go-apps.zip
$STD unzip eebus-go-apps.zip
$STD mv eebus-go-controlbox-simulator-app-main eebus-go-apps
msg_ok "Installed eebus-go-apps"

# Configure systemd
##$STD cp -r /opt/eebus-go-apps/install/debian/systemd/* /usr/lib/systemd/system
#$STD systemctl daemon-reload
#$STD systemctl enable --now eebus-go-controlbox_evcc.service
#$STD systemctl enable --now eebus-go-controlbox_eebus-go-hems.service
#$STD systemctl enable --now eebus-go-controlbox-app.service
#$STD systemctl enable --now eebus-go-hems.service
#$STD systemctl daemon-reload

msg_info "Configuring syslog-ng"
$STD cp -r /opt/eebus-go-apps/install/debian/syslog-ng/conf.d /etc/syslog-ng
systemctl restart -q syslog-ng.service
msg_ok "Configured syslog-ng"

motd_ssh
customize

msg_info "Cleaning up"
$STD apt-get -y autoremove
$STD apt-get -y autoclean
msg_ok "Cleaned"
