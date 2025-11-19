#!/usr/bin/env bash

ds "Creating directories..."

setup_dir() {
    local dirs=(
        ~/.config
        ~/.config/eza
        ~/.config/bash
        ~/.config/ani-cli
        ~/.config/filebrowser
        ~/.config/rclone
        ~/.config/env
        ~/.config/tmux
        ~/.local/bin
        /storage/emulated/0/0-bac
        /storage/emulated/0/0-main
        /storage/emulated/0/0-temp
        /storage/emulated/0/0-restic
        /storage/emulated/0/0-git
    )

    for dir in "${dirs[@]}"; do
        if [ -d "$dir" ]; then
            echo "Directory already exists: $dir"
        elif mkdir -p "$dir"; then
            echo "Successfully created directory: $dir"
        else
            echo "Failed to create directory: $dir"
            exit 1
        fi
    done

    echo -e "\nDone"
}

# Call the function
setup_dir
