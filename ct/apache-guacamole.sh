#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/mstinaff/ProxmoxVE/main/misc/build.func)
# Copyright (c) 2021-2025 community-scripts ORG
# Author: Michel Roegl-Brunner (michelroegl-brunner)
# License: | MIT https://github.com/mstinaff/ProxmoxVE/raw/main/LICENSE
# Source: https://guacamole.apache.org/

APP="Apache-Guacamole"
var_tags="webserver;remote"
var_disk="4"
var_cpu="1"
var_ram="2048"
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
    if [[ ! -d /opt/apache-guacamole ]]; then
        msg_error "No ${APP} Installation Found!"
        exit
    fi
    msg_error "Ther is currently no automatic update function for ${APP}."
    exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}:8080/guacamole${CL}"

