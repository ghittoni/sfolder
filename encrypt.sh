#!/bin/bash
set -euo pipefail
source ./utils/standout_message.sh

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

ARCHIVE="${FOLDER}.tar.zst"
ENCRYPTED_ARCHIVE="${ARCHIVE}.enc"

# Create a tar stream and compress it with zstd.
tar -cvf - "$FOLDER" | zstd -v -o "$ARCHIVE"

# Creates and suggests a key to the user
GENERATED_KEY=$(openssl rand -base64 32)
standout_message "Suggested passphrase: ${GENERATED_KEY}"
echo "${GENERATED_KEY}" >> generated_keys

# Encrypts the archive
openssl enc \
    -aes-256-cbc \
    -salt -pbkdf2 \
    -in "$ARCHIVE" \
    -out "$ENCRYPTED_ARCHIVE"

rm -f "$ARCHIVE"

standout_message "Encrypted archive created: $ENCRYPTED_ARCHIVE"