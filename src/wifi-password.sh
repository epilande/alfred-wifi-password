#!/usr/bin/env bash

QUERY=$1
CURRENT_NETWORK=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}')

if [[ -n "$QUERY" ]]; then
  security find-generic-password -wa $QUERY
else
  security find-generic-password -wa $CURRENT_NETWORK
fi
