#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd -- "${SCRIPT_DIR}/../../.." && pwd)"

source "${PROJECT_ROOT}/src/utils/output/standout_message.sh"
source "${PROJECT_ROOT}/src/utils/global.sh"

# a key has been passed
if (( $# == 1 )); then
    KEY="${$1}"

# no key passed 
else
    KEY=$(openssl rand -base64 32) # creates a new key
fi

# inserts the key in the OS keychain system
security add-generic-password \
  -a "$ACCOUNT" \
  -s "$SERVICE" \
  -w "$KEY"

standout_message "Key generated and saved in the keychain\n\nSave it in your password manager: $(security find-generic-password -a "$ACCOUNT" -s "$SERVICE" -w)"