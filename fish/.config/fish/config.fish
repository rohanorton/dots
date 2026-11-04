# Homebrew
fish_add_path --path --move /opt/homebrew/bin
fish_add_path --path --move /opt/homebrew/sbin

# GNU tools
fish_add_path --path --move /opt/homebrew/opt/coreutils/libexec/gnubin
fish_add_path --path --move /opt/homebrew/opt/findutils/libexec/gnubin
fish_add_path --path --move /opt/homebrew/opt/grep/libexec/gnubin
fish_add_path --path --move /opt/homebrew/opt/gnu-sed/libexec/gnubin
fish_add_path --path --move /opt/homebrew/opt/gawk/libexec/gnubin

# Environment
set -gx EDITOR nvim
set -gx ZK_NOTEBOOK_DIR ~/notes

if status is-interactive
    # Modern CLI tools
    if type -q zoxide
        zoxide init fish | source
    end

    if type -q fzf
        fzf --fish | source
    end

    if type -q mise
        mise activate fish | source
    end

    # Aliases
    alias ls="eza"
    alias ll="eza -la --git --icons"
    alias tree="eza --tree"
    alias cat="bat --paging=never"

    # Ctrl-Z to foreground a suspended process
    function __toggle_fg
        fg
        commandline -f repaint
    end

    bind \cz __toggle_fg
end

set -l local_config ~/.config/fish/config.local.fish
if test -f $local_config
    source $local_config
end
