# ali
# File permissions

alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# python http server file share
alias pyht='cd /storage/emulated/0 && python3 -m http.server 8080'

# python pyftpdlib ftp file share -d for dir like -d /storage/emulated/0/

alias pyftp='python -m pyftpdlib -p 8080 -w -d'


alias nv='nvim'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias fist='filebrowser -c ~/.config/filebrowser/config.json'
alias fied='nv ~/.config/filebrowser/config.json'
# Date display
alias da='date "+%Y-%m-%d %A %T %Z"'

alias lx='eza -l -X -B -h --icons'
alias lk='eza -l -S -r -h --icons'
alias lc='eza -l -t -c -r -h --icons'
alias lu='eza -l -t -u -r -h --icons'
alias lr='eza -l -R -h --icons'
alias lt='eza -l -t -r -h --icons'
alias lm='eza -alh --icons | more'
alias lw='eza -x -A -h --icons'
alias ll='eza -l -F -s --icons'
alias labc='eza -l -a -p --icons'
alias lf="eza -l --icons | grep -v '^d'"
alias ldir="eza -l --icons | grep '^d'"
alias lla='eza -Al --icons'
alias las='eza -A --icons'
alias lls='eza -l --icons'

# Tree views
alias ltree='eza --tree --icons'
alias ltree2='eza --tree --icons -L 2'
alias ltree3='eza --tree --icons -L 3'

alias ltreel='eza --tree --icons -lh'
alias ltreeal='eza --tree --icons -alh'

# archive
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'

# Trash-cli dir cd .local/share/Trash/files/

alias tr='trash-put'
alias tre='trash-empty --trash-dir $HOME/.local/share/Trash'
alias trl='trash-list --trash-dir $HOME/.local/share/Trash'
alias trb='trash-restore --trash-dir $HOME/.local/share/Trash'

#stow verbose check 
alias cst='stow -nvSt'
alias ust='stow -nvDt'
alias ast='stow -vSt'
alias rst='stow -vDt'






#fuc

# fuzzy change to dir with fd

fcd() {
  local dir
  dir=$(fd --type d --hidden --exclude .git | fzf --preview 'ls -la --color=always {}' --bind "tab:toggle-preview" --bind "ctrl-f:change-preview-window(right:90%|right:50%)" --preview-window 'right:50%') && cd "$dir"
}

# fuzzy find live grep with preview - search file contents interactively

frg() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'right:60%:+{2}+3/3:~3' \
      --bind 'tab:toggle-preview' \
      --bind 'ctrl-f:change-preview-window(right:90%|right:60%)' \
      --bind 'enter:become($EDITOR +{2} {1})'
}

# Extract any archive
exx() {
    # If no args, auto-detect archive files using fd -HIi
    if [ $# -eq 0 ]; then
        mapfile -t archives < <(fd -HIi -t f -e zip -e rar -e 7z -e gz -e bz2 -e z -e tar -e tgz -e tbz2 -e tbz -e tb2 -e "tar.gz" -e "tar.bz2")
        if [ ${#archives[@]} -eq 0 ]; then
            echo "📭 No archives found!"
            return 1
        fi
        set -- "${archives[@]}"
    fi

    for archive in "$@"; do
        if [ -f "$archive" ]; then
            filename="$(basename -- "$archive")"
            folder="${filename%.*}"
            folder="${folder%.*}" # handles .tar.gz etc.

            mkdir -p "$folder"
            echo "📦 Extracting $archive → $folder/"

            case "$archive" in
                *.tar.bz2|*.tbz2) tar xvjf "$archive" -C "$folder" ;;
                *.tar.gz|*.tgz)  tar xvzf "$archive" -C "$folder" ;;
                *.tar)           tar xvf "$archive" -C "$folder" ;;
                *.bz2)           bunzip2 -c "$archive" > "$folder/${folder}.out" ;;
                *.gz)            gunzip -c "$archive" > "$folder/${folder}.out" ;;
                *.rar)           unrar x "$archive" "$folder/" ;;
                *.zip)           unzip -d "$folder" "$archive" ;;
                *.Z)             uncompress -c "$archive" > "$folder/${folder}.out" ;;
                *.7z)            7z x "$archive" -o"$folder" ;;
                *)
                    echo "❓ Unknown archive: $archive"
                    rmdir "$folder" 2>/dev/null
                ;;
            esac
        else
            echo "❌ '$archive' not found!"
        fi
    done
}


extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
                *.tar.bz2) tar xvjf "$archive" ;;
                *.tar.gz) tar xvzf "$archive" ;;
                *.bz2) bunzip2 "$archive" ;;
                *.rar) unrar x "$archive" ;;
                *.gz) gunzip "$archive" ;;
                *.tar) tar xvf "$archive" ;;
                *.tbz2) tar xvjf "$archive" ;;
                *.tgz) tar xvzf "$archive" ;;
                *.zip) unzip "$archive" ;;
                *.Z) uncompress "$archive" ;;
                *.7z) 7z x "$archive" ;;
                *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

lgi() {
    git add .
    git commit -m "$1"
    git push
}


# Go up N directories
up() {
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "Usage: up <number>"
        return 1
    fi
    local d="."
    for ((i = 1; i <= $1; i++)); do
        d="$d/.."
    done
    cd "$d" || return
}

# Search text in files
ftext() {
    grep -iIHrn --color=always "$1" . | less -r
}

# Copy with progress bar
cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
        count += $NF
        if (count % 10 == 0) {
            percent = count / total_size * 100
            printf "%3d%% [", percent
            for (i=0;i<=percent;i++)
                printf "="
            printf ">"
            for (i=percent;i<100;i++)
                printf " "
            printf "]\r"
        }
    }
    END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

# Copy and go to directory
cpg() {
    if [ -d "$2" ]; then
        cp "$1" "$2" && cd "$2"
    else
        cp "$1" "$2"
    fi
}

# Move and go to directory
mvg() {
    if [ -d "$2" ]; then
        mv "$1" "$2" && cd "$2"
    else
        mv "$1" "$2"
    fi
}

# Create and go to directory
mkdirg() {
    mkdir -p "$1"
    cd "$1"
}

# Paste to haste bin
hb() {
    if [ $# -eq 0 ]; then
        echo "No file path specified."
        return
    elif [ ! -f "$1" ]; then
        echo "File path does not exist."
        return
    fi

    uri="http://bin.christitus.com/documents"
    response=$(curl -s -X POST -d "$(cat "$1")" "$uri")

    if [ $? -eq 0 ]; then
        hasteKey=$(echo "$response" | jq -r '.key')
        echo "http://bin.christitus.com/$hasteKey"
    else
        echo "Failed to upload the document."
    fi
}

# File organizer (using ripgrep)
so() {
    # Configuration
    SRC_DIR="/storage/emulated/0"
    DEST_BASE="/storage/emulated/0/0a"
    LOG_DIR="/storage/emulated/0/0l"
    PHOTO_DIR="$DEST_BASE/pho"
    VIDEO_DIR="$DEST_BASE/vid"
    APK_DIR="$DEST_BASE/apk"
    AUDIO_DIR="$DEST_BASE/mus"
    DOC_DIR="$DEST_BASE/doc"
    
    # File type definitions
    PHOTO_EXT=("jpg" "jpeg" "png" "gif" "bmp" "webp" "heic" "tiff")
    VIDEO_EXT=("mp4" "mkv" "mov" "avi" "flv" "webm" "wmv" "3gp")
    APK_EXT=("apk" "apkm" "xapk")
    AUDIO_EXT=("mp3" "wav" "flac" "ogg" "opus" "m4a" "aac" "wma")
    DOC_EXT=("html" "pdf" "doc" "docx" "epub" "odt" "rtf" "pages")
    
    # Create directories
    mkdir -p "$PHOTO_DIR" "$VIDEO_DIR" "$APK_DIR" "$AUDIO_DIR" "$LOG_DIR" "$DOC_DIR"
    
    # Initialize logs
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    LOG_FILE="$LOG_DIR/organize_$TIMESTAMP.log"
    JSON_LOG="$LOG_DIR/organize_$TIMESTAMP.json"
    SKIPPED_LOG="$LOG_DIR/skipped_$TIMESTAMP.log"
    
    echo '{"actions": [], "skipped": []}' > "$JSON_LOG"
    touch "$SKIPPED_LOG"
    
    # Count files for progress
    echo "Counting files..."
    RG_CMD="rg --files \"$SRC_DIR/\""
    for ext in "${PHOTO_EXT[@]}" "${VIDEO_EXT[@]}" "${AUDIO_EXT[@]}" "${APK_EXT[@]}" "${DOC_EXT[@]}"; do
        RG_CMD+=" --iglob '*.$ext'"
    done
    RG_CMD+=" --glob '!Android/data/**' --glob '!Android/obb/**'"
    
    TOTAL_FILES=$(eval "$RG_CMD" | wc -l)
    echo "Found $TOTAL_FILES files to process"
    PROCESSED=0
    MOVED=0
    SKIPPED=0
    
    # Process files
    eval "$RG_CMD" | while IFS= read -r file; do
        filename=$(basename "$file")
        extension="${filename##*.}"
        
        case "${extension,,}" in
            "${PHOTO_EXT[@]}") process_file "$file" "$PHOTO_DIR" ;;
            "${VIDEO_EXT[@]}") process_file "$file" "$VIDEO_DIR" ;;
            "${APK_EXT[@]}") process_file "$file" "$APK_DIR" ;;
            "${AUDIO_EXT[@]}") process_file "$file" "$AUDIO_DIR" ;;
            "${DOC_EXT[@]}") process_file "$file" "$DOC_DIR" ;;
        esac
    done
    
    # Finalize logs
    echo -e "\nFile organization complete! Moved $MOVED files, skipped $SKIPPED duplicates."
    echo "Logs saved to: $LOG_DIR"
}

# Helper function for file organizer
process_file() {
    local file="$1"
    local dest_dir="$2"
    local filename=$(basename "$file")
    local dest_file="$dest_dir/$filename"
    
    if [ -f "$dest_file" ]; then
        echo "$(date): SKIPPED (duplicate) - $file -> $dest_file" >> "$LOG_FILE"
        echo "$file -> $dest_file" >> "$SKIPPED_LOG"
        ((SKIPPED++))
    else
        if mv -n "$file" "$dest_dir/"; then
            echo "$(date): MOVED - $file -> $dest_file" >> "$LOG_FILE"
            ((MOVED++))
        else
            echo "$(date): ERROR - Failed to move $file" >> "$LOG_FILE"
        fi
    fi
    
    ((PROCESSED++))
    echo -ne "Progress: $MOVED moved, $SKIPPED skipped, $TOTAL_FILES total ($((PROCESSED*100/TOTAL_FILES))%)\r"
}

# Fuzzy find search termux pkg

spk() {
  local packages
  packages=$(apt-cache search . | fzf --multi \
    --preview 'apt-cache show {1}' \
    --bind "alt-t:toggle-preview" \
    --bind "ctrl-f:change-preview-window(down:90%|down:60%)" \
    --preview-window 'down:60%' \
    --header='Select packages to INSTALL (Tab to select/deselect, Alt-T to toggle preview)' | awk '{print $1}')
  if [ -n "$packages" ]; then
    echo "Selected packages:"
    echo "$packages"
    read -p "Install these packages? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "$packages" | xargs -r pkg install -y
    else
      echo "Installation canceled."
    fi
  else
    echo "No packages selected."
  fi
}


# Fuzzy find Environment variable browser

fenv() {
  env | fzf --preview 'echo {}' --bind "tab:toggle-preview" --bind "ctrl-f:change-preview-window(down:90%|down:20%)" --preview-window down:20% | cut -d= -f1 | xargs -I {} sh -c 'echo {}; echo ${{}}'
}




