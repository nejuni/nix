#!/usr/bin/env bash

echo -e "\n========================================="
echo "Termux Initial Setup"
echo "========================================="

read -p "Run initial setup commands? (y/n): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "\nRunning initial setup...\n"
    
    termux-setup-storage    
    termux-change-repo   
    pkg update && pkg upgrade -y    
    pkg install git gnupg tar gum rsync -y   
    
    echo -e "\n✓ Initial setup completed!"
else
    echo "Skipped initial setup"
fi

gum spin --spinner dot --spinner.foreground 81 --title "Cloning nix repo..." --title.foreground 254 -- sleep 1

rm -rf ~/.local/share/nix

# repo clone
mkdir -p ~/.local/share
cd ~/.local/share
git clone -b main https://github.com/nejuni/nix.git

mkdir -p ~/.local/conf
rsync -avh ~/.local/share/nix/main-conf/ ~/.local/conf/

# Define nix locations used a variable
export NIX_PATH="$HOME/.local/share/nix"
export NIX_INSTALL="$NIX_PATH/main-install"
export NIX_CONF="$HOME/.local/conf"

# Source function
source "$NIX_INSTALL/fu.sh"
cd $NIX_PATH

# ==================================================
# INTERACTIVE MODE SELECTION
# ==================================================

gum style --foreground 81 "════════════════════════════════════════"
gum style --foreground 254 "Installation Mode"
gum style --foreground 81 "════════════════════════════════════════"

MODE=$(gum choose \
    --cursor.foreground 81 \
    --item.foreground 254 \
    --selected.foreground 81 \
    --header "Choose installation mode:" \
    --header.foreground 254 \
    "Automatic (Run all scripts)" \
    "Manual (Confirm each script)")

if [[ "$MODE" == "Automatic (Run all scripts)" ]]; then
    # Automatic mode - runs everything without prompts
    gum style --foreground 81 "\n✓ Running in AUTOMATIC mode\n"
    
    # Install
    source "$NIX_INSTALL/setup/all.sh"
    source "$NIX_INSTALL/config/all.sh"
    
else
    # Manual mode - prompts for each script
    gum style --foreground 81 "\n✓ Running in MANUAL mode\n"
    
    # Setup scripts
    SETUP_SCRIPTS=(
        "$NIX_INSTALL/setup/apt-pkg.sh"
        "$NIX_INSTALL/setup/pyt-pkg.sh"
        "$NIX_INSTALL/setup/dir.sh"
        "$NIX_INSTALL/setup/script-setup.sh"
    )
    
    # Config scripts
    CONFIG_SCRIPTS=(
        "$NIX_INSTALL/config/bash.sh"
        "$NIX_INSTALL/config/filebrowser.sh"
        "$NIX_INSTALL/config/stow.sh"
        "$NIX_INSTALL/config/termux-theme.sh"
    )
    
    # Run setup scripts with confirmation
    gum style --foreground 254 "\n=== SETUP PHASE ===\n"
    for script in "${SETUP_SCRIPTS[@]}"; do
        if cf "Run $(basename $script)?"; then
            run "$script"
        else
            gum style --foreground 254 "⊘ Skipped: $(basename $script)"
        fi
    done
    
    # Run config scripts with confirmation
    gum style --foreground 254 "\n=== CONFIG PHASE ===\n"
    for script in "${CONFIG_SCRIPTS[@]}"; do
        if cf "Run $(basename $script)?"; then
            run "$script"
        else
            gum style --foreground 254 "⊘ Skipped: $(basename $script)"
        fi
    done
fi

# Check your summary by function
show_summary
