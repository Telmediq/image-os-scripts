#!/usr/bin/env bash

function do_work() {
  # Dependencies
  install_deps

  # Final Step
  remove_self
}

function install_deps() {
  # Dependencies
  deps=()

  # Generic utilities
  deps+=(grep util-linux coreutils findutils)

  # Web utilities
  deps+=(wget curl ca-certificates)

  # Process diagnostics
  deps+=(procps htop sysstat strace)

  # Network diagnostics
  deps+=(nethogs dnsutils)
  deps+=(iputils-ping iputils-tracepath iputils-clockdiff iputils-arping)

  # Install Dependencies
  apt-get update
  apt-get install -y "${deps[@]}"
  apt-get clean
}

function remove_self() {
  SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
  rm -rf ${SCRIPT_PATH}/alpine.bash
}

set -ex
do_work