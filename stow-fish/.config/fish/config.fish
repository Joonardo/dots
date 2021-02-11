dbus-update-activation-environment --systemd DISPLAY
set -gx SSH_AUTH_SOCK (gnome-keyring-daemon --start --components=pkcs11,secrets,ssh | awk -F "=" '$1 == "SSH_AUTH_SOCK" { print $2 }')

set -gx VIRTUAL_ENV_DISABLE_PROMPT true
set -gx PAGER /usr/bin/most
set -gx BAT_PAGER /usr/bin/less
set -gx EDITOR nvim
set -gx PATH $HOME/.local/bin $PATH

set -g theme_display_virtualenv yes
set -g theme_date_format "+%d.%m.%y %H:%M"
set -g theme_project_dir_length 1
set -g theme_color_scheme gruvbox
set -g fish_color_command #3c3836
set -g fish_color_param #928374

complete --command parrot -f --arguments='(find $HOME/.local/share/parrotify/* -maxdepth 1 -type d -printf "%f\\n")'

if status --is-interactive
  theme_gruvbox dark soft
end

thefuck --alias | source

fish_vi_key_bindings
