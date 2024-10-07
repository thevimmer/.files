# Wayland
if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
  export XDG_RUNTIME_DIR="/run/user/$(id -u)"
  export WAYLAND_DISPLAY="wayland-0"
  export XDG_SESSION_TYPE="wayland"
  export GDK_BACKEND="wayland"
  export GDK_SCALE=1
  export GDK_DPI_SCALE=1
  export MOZ_ENABLE_WAYLAND=1
  exec Hyprland
fi

# Apperance
autoload -U colors && colors
PS1="%B%F{2} %f%b %B%F{6}%~%f%b "

# History setting
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/history"

# Alias 
alias sudo="sudo EDITOR=nvim"
alias ls='ls --sort=time --color=auto --reverse'
alias la='ls --sort=time --color=auto -a --reverse'
alias ll='ls --sort=time --color=auto -l -a -h --reverse'
alias grep='rg --color=auto'
alias ..='cd ..'
alias v='nvim'
alias pac="sudo pacman"
alias cal="cal -m"
alias sf="ls | grep -i"
alias sl="ls -1 | grep -i"
alias org="nvim $HOME/Organizer/home.wiki"
alias emacs="emacsclient -c -a ''"
alias lf="nnn"
alias wt="wiki-tui"
alias j="jrnl"

# Vim mode
bindkey -v
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd  ]] || [[ $1 = 'block'  ]]
	then
	  echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main  ]] || [[ ${KEYMAP} == viins  ]] || [[ ${KEYMAP} = ''  ]] || [[ $1 = 'beam'  ]]
	then
		 echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins 
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' 
preexec() { echo -ne '\e[5 q' ;}

# Functions
function o {
  xdg-open $@ &
}
function fzo {
  o "$(fzf)"
}
function githc {
  git clone --depth 1 "https://github.com/$@"
}

# Plugins
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2> /dev/null
