#!/usr/bin/env bash

source ./bootstrap-scripts/set_env.sh

while [ $# -gt 0 ]; do
  case "$1" in
    --federation-id=*)
      federation_id="${1#*=}"
      ;;
    --node=*)
      node="${1#*=}"
      ;;
	--secret=*)
	  secret="${1#*=}"
	  ;;
  esac
  shift
done

FEDERATION_DIR="$TENANTS_DIR/$federation_id"
NODE_ID="heimdall-$node"

FM_PID_FILE="$FEDERATION_DIR/node-$node.pid"

exec (($FM_BIN_DIR/fedimintd $FEDERATION_DIR/$NODE_ID "$secret" 2>&1 & echo $! >&3) 3>>$FM_PID_FILE)
