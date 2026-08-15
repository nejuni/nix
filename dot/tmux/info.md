tmux Configuration Guide

This guide explains the provided tmux.conf settings line‑by‑line with examples.


---

🛠️ Options

True Color Support

set -sg terminal-overrides ",*:RGB"

Enables 24‑bit true color for better themes in terminals.

Fast Escape Keys

set -g escape-time 0

Stops delay after pressing Esc (helpful in Vim).

Enable Mouse Support

set -g mouse on

Enables scrolling, clicking to switch panes, resize panes, etc.

Sequential Window Numbers

set -g renumber-windows on

If a window closes, numbers are renumbered to stay sequential.

Prefix Repeat Time

set -g repeat-time 1000

1‑second delay to repeat bindings without pressing prefix again.

Start Index from 1

set -g base-index 1
set -g pane-base-index 1

Windows & panes start at 1 instead of 0.


---

⌨️ Prefix Key Change

Change prefix to comma (,)

unbind C-b
set -g prefix ,
bind , send-prefix

Press , to activate tmux commands

Press ,, to type a comma normally



---

🎨 Theme Settings

Pane Borders

set -g pane-border-lines simple
set -g pane-border-style fg=black,bright
set -g pane-active-border-style fg=magenta

Active pane = magenta border

Inactive pane = bright black border


Status Bar Appearance

set -g status-style bg=default,fg=black,bright
set -g status-left ""
set -g status-right "#[fg=black,bright]#S"

Minimal bar, only shows session name on the right


Window Indicators

set -g window-status-format "●"
set -g window-status-current-format "●"
set -g window-status-current-style "#{?window_zoomed_flag,fg=yellow,fg=magenta,nobold}"
set -g window-status-bell-style "fg=red,nobold"

Current window shown as a dot (●)

Zoomed window = yellow dot, normal active window = magenta dot



---

🧭 Navigation Keybinds

Pane Movement (WASD)

bind w select-pane -U
bind a select-pane -L
bind s select-pane -D
bind d select-pane -R

Example: ,w = move up, ,a = left.

Resize Panes (Shift + WASD)

bind -r W resize-pane -U
bind -r A resize-pane -L
bind -r S resize-pane -D
bind -r D resize-pane -R

Arrow Keys Move Panes

bind Up select-pane -U
bind Left select-pane -L
bind Down select-pane -D
bind Right select-pane -R


---

🪟 Splitting Panes

bind h split-window -h
bind | split-window -h
bind v split-window -v
bind - split-window -v

,h = horizontal split

,v = vertical split



---

🧰 Other Useful Commands

bind f resize-pane -Z    # zoom pane
bind q detach-client     # exit tmux
bind e choose-window -Z  # window menu

No‑prefix movement (Alt + WASD)

bind -n M-w select-pane -U
bind -n M-a select-pane -L
bind -n M-s select-pane -D
bind -n M-d select-pane -R
bind -n M-f resize-pane -Z

Move panes with Alt+w/a/s/d.


---

🔁 Session Navigation

bind b switch-client -p  # previous session
bind n switch-client -n  # next session

Kill current session & jump back

bind z run-shell 'current_session=$(tmux display-message -p "#{session_name}"); tmux switch-client -p; tmux kill-session -t "$current_session"'

Kill tmux entirely

bind x kill-server


---

📌 Quick Key Cheat Sheet

Action	Keys

Prefix	,
Move panes	,w  ,a  ,s  ,d
Resize panes	,W  ,A  ,S  ,D
Split	,h = Horizontal · ,v = Vertical
Zoom	,f
Next/Prev session	,n / ,b
Detach	,q
Kill tmux	,x
Alt‑move pane	Alt + w/a/s/d



---

🔄 Reload tmux config (add manually)

bind r source-file ~/.tmux.conf \; display "Config Reloaded"

Then reload with:

,r


---

Enjoy your optimized tmux workflow! 🚀