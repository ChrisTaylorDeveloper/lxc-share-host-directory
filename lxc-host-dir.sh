#!/usr/bin/env bash

# LXC mount host directory
#
# Usage:
#   lxc-host-dir.sh mount <container> <device> <host_path> <container_path>
#   lxc-host-dir.sh -h | --help
#   lxc-host-dir.sh --version
#
# Options:
#   -h --help     Show this help information.
#   -v --version     Show version information.

VERSION='LXC mount host directory 1.0'
source docopts.sh
usage=$(docopt_get_help_string "$0")
eval "$(docopts -A ARGS -V "$VERSION" -h "$usage" : "$@")"
# docopt_print_ARGS

lxc config device add "${ARGS[<container>]}" "${ARGS[<device>]}" disk source="${ARGS[<host_path>]}" path="${ARGS[<container_path>]}"
