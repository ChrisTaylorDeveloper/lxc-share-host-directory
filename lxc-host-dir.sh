#!/usr/bin/env bash

# LXC mount host directory
#
# Usage:
#   lxc-host-dir.sh mount [-s | --shift] <container> <device> <host_path> <container_path>
#   lxc-host-dir.sh -h | --help
#   lxc-host-dir.sh --version
#
# Options:
#   -h --help     Show this help message.
#   -v --version  Show version information.
#   -s --shift    Add shift=true to the 'lxc config device add' command.

VERSION='LXC mount host directory 1.2'
source docopts.sh
usage=$(docopt_get_help_string "$0")
eval "$(docopts -A ARGS -V "$VERSION" -h "$usage" : "$@")"
# docopt_print_ARGS

if [[ "${ARGS['--shift']}" == 'true' ]]; then
  shift='shift=true'
else
  shift=''
fi

lxc config device add "${ARGS[<container>]}" "${ARGS[<device>]}" disk source="${ARGS[<host_path>]}" path="${ARGS[<container_path>]}" $shift
