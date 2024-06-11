if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx HOMEBREW_NO_ENV_HINTS true
set -gx EDITOR "nvim"
set -gx GIT_EDITOR "nvim"
set -gx PYENV_ROOT "$HOME/.pyenv"

alias cdd="cd $HOME/Developer"
set fish_greeting
fish_vi_key_bindings

fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path "$HOME/.composer/vendor/bin"
fish_add_path "$PYENV_ROOT/bin"

source "$HOME/.cargo/env.fish"
source ~/.orbstack/shell/init.fish 2>/dev/null || :
pyenv init - | source

for file in ~/.config/fish/conf.d/*.fish
    source $file
end

