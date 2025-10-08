#!/usr/bin/env bash

# Simple Script Runner with gum
set -euo pipefail

# Counters
SUCCESS=0
FAILED=0
FAILED_SCRIPTS=()

# Run function with custom message
ds() {
    local msg="$1"
    
    gum spin --spinner dot --spinner.foreground 81 --title "$msg" --title.foreground 254 -- sleep 2
}

# Export the functions so child scripts can use them
export -f ds

# Run script
run() {
    local script="$1"
    
    echo ""
    gum style --foreground 81 "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    gum style --foreground 254 "Running: $script"
    gum style --foreground 81 "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if bash -e "$script"; then
        gum style --foreground 81 "✓ SUCCESS: $script"
        SUCCESS=$((SUCCESS + 1))
    else
        gum style --foreground 254 "✗ FAILED: $script"
        gum style --foreground 254 "Continuing to next script..."
        FAILED=$((FAILED + 1))
        FAILED_SCRIPTS+=("$script")
    fi
}

# Summary
show_summary() {
    local total=$((SUCCESS + FAILED))
    
    echo ""
    gum style --foreground 81 "════════════════════════════════════════"
    gum style --foreground 254 "SUMMARY"
    gum style --foreground 81 "════════════════════════════════════════"
    gum style --foreground 254 "Total:   $total"
    gum style --foreground 81 "Success: $SUCCESS"
    gum style --foreground 254 "Failed:  $FAILED"
    
    if [ $FAILED -eq 0 ]; then
        echo ""
        gum style --foreground 81 "✓ All scripts completed successfully!"
    else
        echo ""
        gum style --foreground 254 "⚠ $FAILED script(s) failed"
        echo ""
        gum style --foreground 81 "Failed Scripts:"
        for script in "${FAILED_SCRIPTS[@]}"; do
            gum style --foreground 254 --border normal --border-foreground 81 --padding "0 1" --margin "1 0" "✗ $(basename $script)"
        done
    fi
}

gum style --foreground 81 "Simple Script Runner Loaded"