#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

online_wan_option_string="@online_wan_icon"
offline_wan_option_string="@offline_wan_icon"
route_to_ping_string="@route_to_ping"
route_to_ip_string="@route_to_ip"

online_wan_icon_osx="ⓦ "
online_wan_icon="WAN: "
offline_wan_icon_osx="⨂ "
offline_wan_icon="NO INERNET ACCESS "
route_to_ping_default="www.google.com"
route_to_ip_default="http://whatismyip.akamai.com/"

online_wan_icon_default() {
	if is_osx; then
		echo "$online_wan_icon_osx"
	else
		echo "$online_wan_icon"
	fi
}
offline_wan_icon_default() {
	if is_osx; then
		echo "$offline_wan_icon_osx"
	else
		echo "$offline_wan_icon"
	fi
}

online_wan_status() {
	ping -c 1 $(get_tmux_option "$route_to_ping_string" "$route_to_ping_default") >/dev/null 2>&1
}

ip_wan_status() {
    curl --max-time 2 -s $(get_tmux_option "$route_to_ip_string" "$route_to_ip_default")
}

print_wan_status() {
	# spacer fixes weird emoji spacing
	local spacer=" "
	if $(online_wan_status); then
    printf "$(get_tmux_option "$online_wan_option_string" "$(online_wan_icon_default)")$spacer$(ip_wan_status)"
	else
		printf "$(get_tmux_option "$offline_wan_option_string" "$(offline_wan_icon_default)")$spacer"
	fi
}

main() {
  print_wan_status
}
main
