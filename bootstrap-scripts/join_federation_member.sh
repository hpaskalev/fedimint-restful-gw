#!/usr/bin/env bash

source ./bootstrap-scripts/set_env.sh

while [ $# -gt 0 ]; do
  case "$1" in
    --federation-id=*)
      federation_id="${1#*=}"
      ;;
	--member-id=*)
	  member_id="${1#*=}"
	  ;;
	--connection-info=*)
	  connection_info="${1#*=}"
	  ;;
  esac
  shift
done

MEMBER_DIR="$TENANTS_DIR/$federation_id/members/$member_id"
FM_MEMBER_CLIENT="$FM_BIN_DIR/fedimint-cli --workdir $MEMBER_DIR"

$FM_MEMBER_CLIENT join-federation "$connection_info" | jq -r

