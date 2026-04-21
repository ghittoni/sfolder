#!/bin/bash

# if the user forgets to specify the name of the encrypted archive
if [ -z "$1" ]; then
    echo "Error: you need to specify the name of the encrypted archive you want to decrypt."
    echo "Example: decrypt.sh <archive.tar.xz.enc>"
    exit 1
fi

FOLDER="$1"
ARCHIVE="$FOLDER.tar.zst"
ENCRYPTED_ARCHIVE="$ARCHIVE.enc"

openssl enc -d \
        -aes-256-cbc \
        -pbkdf2 \
        -in "$ENCRYPTED_ARCHIVE" \
        -out "$ARCHIVE"

tar --use-compress-program="zstd" \
    -xvf \
    "$ARCHIVE"

rm -f "$ARCHIVE"