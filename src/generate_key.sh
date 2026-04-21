#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils/standout_message.sh"

# Creates a new key
KEY=$(openssl rand -base64 32)
standout_message "Generated key: ${KEY}"

# Saves the generated key in a file 
LOGS_DIR="${SCRIPT_DIR}/logs"
LOGS_DIR_KEYS="${LOGS_DIR}/generated_keys"
mkdir -p "$LOGS_DIR"
echo "${KEY}" >> "$LOGS_DIR_KEYS"