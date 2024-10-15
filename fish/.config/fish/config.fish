if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
fish_vi_key_bindings

eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx HOMEBREW_NO_ENV_HINTS true

alias cdd="cd $HOME/Developer"
fish_add_path "$HOME/.local/bin"
fish_add_path "/usr/local/bin"

set -gx EDITOR "nvim"
set -gx GIT_EDITOR "nvim"

# Docker
source ~/.orbstack/shell/init.fish 2>/dev/null || :

# Android
set -gx JAVA_HOME "/Applications/Android Studio.app/Contents/jbr/Contents/Home"
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx NDK_HOME "$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"

# PHP
fish_add_path "$HOME/.composer/vendor/bin"

# TypeScript
set -gx DENO_INSTALL "/Users/pf1gura/.deno"
fish_add_path "$DENO_INSTALL/bin"
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Python
set -gx PYENV_ROOT "$HOME/.pyenv"
fish_add_path "$PYENV_ROOT/bin"
pyenv init - | source

# Ruby
rbenv init - | source

# Rust
source "$HOME/.cargo/env.fish"

