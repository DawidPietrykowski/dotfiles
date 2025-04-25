if status is-interactive
    # Commands to run in interactive sessions can go here
    uv generate-shell-completion fish | source
    uvx --generate-shell-completion fish | source

    # argc-completions
    set -gx ARGC_COMPLETIONS_ROOT "$HOME/.config/fish/argc-completions"
    set -gx ARGC_COMPLETIONS_PATH "$HOME/.config/fish/argc-completions/completions"
    fish_add_path -m "$ARGC_COMPLETIONS_ROOT/bin"
    set argc_scripts (ls -1 "$HOME/.config/fish/argc-completions/completions" | sed -n 's/\.sh$//p')
    #~/.config/fish/argc-completions/bin/argc --argc-completions fish $argc_scripts | source
    argc --argc-completions fish $argc_scripts | source
end

# Disable greeting
set -g fish_greeting

# abbr
abbr -a psp --position anywhere pacman -Sy

abbr -a l eza -l --color=always --group-directories-first
abbr -a ll eza --color=always --group-directories-first # without all the info about ownership n stuff 
abbr -a la eza -aal --color=always --group-directories-first # everything
abbr -a lt eza -aT --color=always --group-directories-first # tree listing
abbr -a lm eza -l --color=always --group-directories-first --sort modified

abbr g git

abbr -a rs rsync -rav --info=progress2 --no-i-r

abbr -a ds --position anywhere docker compose
abbr -a dsu --position anywhere docker compose up -d
abbr -a dsp --position anywhere docker compose pull

abbr -a s sudo

abbr -a stl --position anywhere systemctl

abbr -a zl 'z $PWD'

abbr -a h helix

abbr -a hm history merge

abbr -a uvv 'uv venv -q --allow-existing --seed; source .venv/bin/activate.fish'
abbr -a uvd deactivate
alias pip="uv pip"

abbr -a lg lazygit

alias get_idf=". $HOME/storage/esp-idf/export.fish"
alias get_matter="source $HOME/storage/esp-matter/export.sh"

# Locale
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Set global envs
set -gx EDITOR $HOME/.cargo/bin/hx
set -gx CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -gx ELECTRON_OZONE_PLATFORM_HINT wayland

# Add paths
fish_add_path ~/Scripts/
fish_add_path ~/.cargo/bin
fish_add_path ~/Android/Sdk/cmdline-tools/latest/bin/
fish_add_path ~/.local/bin/

# Add only for MacOS
set -l os (uname)
if test "$os" = Darwin
    fish_add_path /opt/homebrew/bin
end

function fish_should_add_to_history
    # Ignore "set" commands if the variable being set contains "KEY" in the name
    if string match -qr '^set' -- $argv
        set var_name (string split ' ' -- $argv)[2]
        if string match -qr KEY -- $var_name
            return 1
        end
    end

    # If no conditions are met, add the command to history
    return 0
end

# tide config
set -gx tide_context_always_display true

# fzf config
fzf_configure_bindings --directory=\cf

set fzf_preview_dir_cmd eza --all --color=always
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
set fzf_fd_opts --hidden

# fifc
set -U fifc_keybinding \cx

set -U fifc_fd_opts --hidden
