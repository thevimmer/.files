add_path() {
    if [ -d $1 ]; then
	export PATH="$1:$PATH"
    fi
}

add_path "$HOME/.local/bin"
add_path "$HOME/.local/cargo/bin"
add_path "$(go env GOPATH)/bin"
add_path "$HOME/.local/bun/bin"

export EDITOR="nvim"
export BROWSER="firefox"

export CARGO_HOME="$HOME/.local/cargo"
export GOPATH="$HOME/.local/go"
export NPM_CONFIG_FOO="$HOME/.config/npm"
export VBOX_USER_HOME="$HOME/.local/share/virtualbox"
export EMACSDIR="$HOME/.config/emacs"
