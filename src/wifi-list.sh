#!/usr/bin/env bash

networksetup -listpreferredwirelessnetworks en0 | tail -n +2 | tr -d '\t' | /usr/local/bin/jq -Rs '{ items:
  (. / "\n" | map(
    select(length > 0)
    | {
        title: .,
        subtitle: ("Get Wi-Fi password for " + .),
        arg: .,
      }
  ))
}'
