if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
fish_vi_key_bindings

if test (uname) = "Darwin"
	eval "$(/opt/homebrew/bin/brew shellenv)"

	alias cdd="cd $HOME/Developer"

	set -gx HOMEBREW_NO_ENV_HINTS true

	fish_add_path "$HOME/.composer/vendor/bin"
	fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

	source ~/.orbstack/shell/init.fish 2>/dev/null || :
end

if test -e "/etc/wsl.conf"
	alias cdd="cd /projects"
	fish_add_path "/opt/nvim-linux64/bin"
	fish_add_path "$HOME/.local/bin"
end

set -gx EDITOR "nvim"
set -gx GIT_EDITOR "nvim"

set -gx PYENV_ROOT "$HOME/.pyenv"
fish_add_path "$PYENV_ROOT/bin"
pyenv init - | source

rbenv init - | source

source "$HOME/.cargo/env.fish"

