#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils/standout_message.sh"

# If the user forgets to specify the encrypted archive name.
if (( $# < 1 )); then
    standout_message "Error, you need to specify the encrypted archive you want to decrypt.\nExample: decrypt.sh <archive.tar.zst.enc>"
    exit 1
fi

INPUT="$1"
if [[ "$INPUT" == *.tar.zst.enc ]]; then
    ENCRYPTED_ARCHIVE="$INPUT"
else
    standout_message "Error, you need to specify a .tar.zst.enc encrypted archive to proceed"
    exit 1
fi

if [ ! -f "$ENCRYPTED_ARCHIVE" ]; then
    standout_message "Error: encrypted archive '$ENCRYPTED_ARCHIVE' does not exist."
    exit 1
fi

# Decrypts, decompress and extracts the archive payload without creating
# any intermediate file
if ! openssl enc -d \
        -aes-256-cbc \
        -pbkdf2 \
        -iter 1000000 \
        -in "$ENCRYPTED_ARCHIVE" \
    | zstd -d -c \
    | tar -xvf -; 
    then

    standout_message "Decryption failed: wrong passphrase or corrupted encrypted archive."
    exit 1
else
    standout_message "Archive extracted successfully."
fi
