#!/usr/bin/env bash

USER_ID=1000
GROUP_ID=1000

function do_work() {
  # Additional logic
  create_appuser
  create_app_folder

  # Final Step
  remove_self
}

function create_appuser() {
  mkdir -p /home/appuser
  groupadd -g ${GROUP_ID} appuser
  useradd -r -u ${USER_ID} -g appuser -d /home/appuser -s /bin/bash appuser
  chown -R ${USER_ID}:${GROUP_ID} /home/appuser
}

function create_app_folder() {
  # Add app directory
  mkdir -p /opt/app
  chown -R ${USER_ID}:${GROUP_ID} /opt/app
}

function remove_self() {
  SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
  rm -rf ${SCRIPT_PATH}/alpine.bash
}

set -ex
do_work