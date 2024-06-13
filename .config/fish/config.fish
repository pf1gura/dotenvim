if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
fish_vi_key_bindings

if test (uname) = "Darwin"
	eval "$(/opt/homebrew/bin/brew shellenv)"

	alias cdd="cd $HOME/Developer"
	fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

	set -gx HOMEBREW_NO_ENV_HINTS true

	fish_add_path "$HOME/.composer/vendor/bin"

	# set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
	set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
	set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
	set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
	fish_add_path "$ANDROID_HOME/emulator"
	fish_add_path "$ANDROID_HOME/platform-tools"
	# fish_add_path "$ANDROID_HOME/cmdline-tools/latest/bin"
	fish_add_path "$ANDROID_HOME/cmdline-tools/10.0/bin"

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

