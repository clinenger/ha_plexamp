#!/usr/bin/with-contenv bashio

CLAIM_TOKEN=$(bashio::config 'claim_token')
PLAYER_NAME=$(bashio::config 'player_name')

if [ -n "$CLAIM_TOKEN" ]; then
  export PLEXAMP_CLAIM_TOKEN="$CLAIM_TOKEN"
fi

export PLEXAMP_PLAYER_NAME="$PLAYER_NAME"

exec /init
