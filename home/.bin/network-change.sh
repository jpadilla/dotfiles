#!/bin/bash

SSID=$(networksetup -getairportnetwork en0 | cut -c 24-)
CONNECTION_NAME="PIA US East"
WHITELIST_SSIDS=("Millennium Falcon" "USS Enterprise")
UNTRUSTED=true

for ssid in "${WHITELIST_SSIDS[@]}"; do
  if [[ "$SSID" == "$ssid" ]]; then
    UNTRUSTED=false
  fi
done

if [[ $UNTRUSTED == true ]]; then
  osascript -e "tell application \"Viscosity\" to connect \"$CONNECTION_NAME\""
fi
