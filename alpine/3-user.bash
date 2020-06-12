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
  addgroup --gid ${GROUP_ID} -S appgroup
  adduser --uid ${USER_ID} --home /home/appuser --shell /bin/bash -S appuser -G appgroup
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