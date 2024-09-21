if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
fish_vi_key_bindings

eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx HOMEBREW_NO_ENV_HINTS true

alias cdd="cd $HOME/Developer"
fish_add_path "/usr/local/bin"
fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

set -gx EDITOR "nvim"
set -gx GIT_EDITOR "nvim"

# Android
 set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
 fish_add_path "$ANDROID_HOME/cmdline-tools/latest/bin"
#set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
#fish_add_path "$ANDROID_HOME/cmdline-tools/10.0/bin"
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
fish_add_path "$ANDROID_HOME/emulator"
fish_add_path "$ANDROID_HOME/platform-tools"

# Docker
source ~/.orbstack/shell/init.fish 2>/dev/null || :

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

