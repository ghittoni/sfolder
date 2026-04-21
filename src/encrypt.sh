#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils/standout_message.sh"

# Ensures required dependency is available before continuing.
if ! command -v zstd >/dev/null 2>&1; then
    standout_message "Error: 'zstd' is not installed or not available in PATH."
    exit 1
fi

# If the user forgets to specify the folder name an error occurs
if (( $# < 1 )); then
    standout_message "Error, you need to specify the name of the folder you want to encrypt.\nExample: encrypt.sh <folder_name>"
    exit 1
fi

# Checks if the folder exsists before proceding
FOLDER="$1"
if [ ! -d "$FOLDER" ]; then
    echo "Error: folder '$FOLDER' does not exist."
    exit 1
fi

ENCRYPTED_ARCHIVE="${FOLDER}.tar.zst.enc"

# Creates a tar stream, compresses it with zstd, and encrypts it without 
# creating any additional temp file
if ! tar -cf - "$FOLDER" \
    | zstd -c \
    | openssl enc \
        -aes-256-cbc \
        -salt \
        -pbkdf2 \
        -iter 1000000 \
        -out "$ENCRYPTED_ARCHIVE"; 
    then

    rm -f "$ENCRYPTED_ARCHIVE"
    standout_message "Encryption failed: archive creation, compression, or encryption failed."
    exit 1
else
    standout_message "Encrypted archive created: $ENCRYPTED_ARCHIVE"
fi
