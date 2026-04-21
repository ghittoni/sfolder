#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd -- "${SCRIPT_DIR}/../../.." && pwd)"

source "${PROJECT_ROOT}/src/utils/output/standout_message.sh"
source "${PROJECT_ROOT}/src/utils/global.sh"

security delete-generic-password \
  -a "$ACCOUNT" \
  -s "$SERVICE"

standout_message "Key succesfully deleted from the keychain"