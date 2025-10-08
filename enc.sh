#!/usr/bin/env bash

# enc.sh encryption script and backup important files

# removing old encrypted files
for file in enc.tar.gpg enc.tar; do
    if [ -f "$file" ]; then
        rm "$file"
    fi
done        

# creating new encrypted file
tar -cvf enc.tar enc/

# backing up previous one
mkdir -p bac/$(date +%d-%m-%Y_%H-%M-%S) && cp enc.tar bac/$(date +%d-%m-%Y_%H-%M-%S)/

gpg -c --cipher-algo AES256 --s2k-mode 3 --s2k-count 65011712 --s2k-digest-algo SHA512 --compress-algo 0 enc.tar

gum style --foreground 81 "Encryption Successful"

