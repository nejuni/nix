#!/usr/bin/env bash

# Fix GPG TTY issue
export GPG_TTY=$(tty)

# For gpg
# Decrypting
cd $NIX_PATH
gpg --pinentry-mode loopback -d -o enc.tar enc.tar.gpg
tar -xf enc.tar

# Importing keys
gpg --import $NIX_PATH/enc/gpg/*.asc && gpg --import-ownertrust $NIX_PATH/enc/gpg/ownertrust.txt