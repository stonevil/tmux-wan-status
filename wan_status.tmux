#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/scripts/helpers.sh

wan_status="#($CURRENT_DIR/scripts/wan_status.sh)"
wan_status_interpolation_string="\#{wan_status}"

do_interpolation() {
	local string=$1
	local interpolated=${string/$wan_status_interpolation_string/$wan_status}
	echo "$interpolated"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
