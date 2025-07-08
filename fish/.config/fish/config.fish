if status is-interactive
    starship init fish | source

    zoxide init fish | source

    uv generate-shell-completion fish | source
    uvx --generate-shell-completion fish | source

    # Disable multi selection on TAB
    set -x FZF_CTRL_T_OPTS "--bind=tab:down,shift-tab:up"
    fzf --fish | source

    # Alias hx to helix if hx is missing but helix exists
    if not command -q hx; and command -q helix
        alias hx helix
    end

    bind ctrl-e backward-kill-bigword
end

# Disable greeting
set -g fish_greeting

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

abbr -a hm history merge

abbr -a uvv 'uv venv -q --allow-existing --seed; source .venv/bin/activate.fish'
abbr -a uvd deactivate
alias pip="uv pip"

abbr -a lg lazygit

abbr -a ho handlr open

alias get_idf=". $HOME/storage/esp-idf/export.fish"
alias get_matter="source $HOME/storage/esp-matter/export.sh"

# Locale
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Set global envs

# Alias hx to helix if hx is missing but helix exists
if command -q hx
    set -gx EDITOR (which hx)
else if command -q helix
    set -gx EDITOR (which helix)
end
set -gx CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -gx ELECTRON_OZONE_PLATFORM_HINT wayland

function k --description 'kill last process with name' -a name
    ps -aux | rg -F "$name" | rg -v 'rg' | choose 1 | tail -n 1 | xargs kill -9
end

function utgz --description 'decompress .tar.gz' -a file
    pigz -dc "$file" | tar -xf -
end

# Add paths
fish_add_path ~/Scripts/
fish_add_path ~/.cargo/bin
fish_add_path ~/Android/Sdk/cmdline-tools/latest/bin/
fish_add_path ~/.local/bin/

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
