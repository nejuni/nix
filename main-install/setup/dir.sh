#!/usr/bin/env bash

ds "Creating directories..."

setup_dir() {
    local dirs=(
        ~/.config
        ~/.ssh
        ~/.config/eza
        ~/.config/bash
        ~/.config/filebrowser
        ~/.config/rclone
        ~/.config/tmux
        ~/.config/yazi
        ~/.local/bin
        ~/tp-script/
        /storage/emulated/0/00
        /storage/emulated/0/00/0d
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
