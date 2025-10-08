# ali
# File permissions
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

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

# Archive operations
alias mktar='tar -cvf'
alias untar='tar -xvf'






#fuc
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


