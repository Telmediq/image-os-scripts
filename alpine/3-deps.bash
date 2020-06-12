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
  # https://pkgs.alpinelinux.org/package/edge/main/x86/grep - 200 kB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/util-linux - 3.76 MB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/coreutils - 1.25 MB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/findutils - 548 kB
  deps+=(grep util-linux coreutils findutils)

  # Web utilities
  # https://pkgs.alpinelinux.org/package/edge/main/x86/wget - 508 kB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/curl - 232 kB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/ca-certificates - 672 kB
  deps+=(wget curl ca-certificates)

  # Process diagnostics
  # https://pkgs.alpinelinux.org/package/edge/main/x86/procps - 516 kB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/htop - 192 kB
  # https://pkgs.alpinelinux.org/package/edge/community/x86/sysstat - 944 kB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/strace - 932 kB
  deps+=(procps htop sysstat strace)

  # Network diagnostics
  # https://pkgs.alpinelinux.org/package/edge/community/x86/nethogs - 72 kB
  # https://pkgs.alpinelinux.org/package/v3.3/main/x86/iputils - 236 kB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/busybox-extras - 100 kB
  # https://pkgs.alpinelinux.org/package/edge/main/x86/bind-tools - 632 kB
  deps+=(nethogs iputils busybox-extras bind-tools)

  # Install Dependencies
  apk add --no-cache "${deps[@]}"
}

function remove_self() {
  SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
  rm -rf ${SCRIPT_PATH}/alpine.bash
}

set -ex
do_work