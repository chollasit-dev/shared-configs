setopt extendedglob
setopt LIST_TYPES

ZSH_THEME=robbyrussell
# `echo $RANDOM_THEME` to check the current random theme.
# ZSH_THEME=random

# Override candidate theme list instead of from `$ZSH/themes`
# This variable will have no effect if set to an empty array.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

zstyle ':omz:update' mode auto
# zstyle ':omz:update' mode reminder  # remind to update manually
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' frequency 15 # frequency 15 days

# Prevent pasting URLs and other text is messed up.

DISABLE_MAGIC_FUNCTIONS="true"

# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="%F{yellow}Chill, btw...%f"

# Disable marking untracked files under VCS as dirty.
# Makes repository status check for large repos faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Or set a custom format using strftime function with format specifications.
# see `man strftime`
HIST_STAMPS="yyyy-mm-dd"

# Set custom directory apart from $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins `$ZSH/plugins/`
# Custom plugins `$ZSH_CUSTOM/plugins/`
plugins=(
	"alias-finder"
	"catimg"
	"colored-man-pages"
	"copybuffer" # `ctrl + o` copy to clipboard
	"copyfile"
	"copypath"
	"dircycle"
	"dirpersist"
	"emoji"
	"emoji-clock"
	"fancy-ctrl-z"
	"fzf"
	"git-commit"
	"gitignore"
	"globalias"
	"history"
	"jira"
	"mongo-atlas"
	"mongocli"
	"ng"
	"otp"
	"pm2"
	"safe-paste"
	"shell-proxy"
	"sudo"
	"systemadmin"
	"systemd"
	"urltools"
	"zsh-interactive-cd"
	"zsh-navigation-tools"
)

# May needed if migrate from Bash
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
# Go
export PATH="$HOME/go/bin:$HOME/bin:/usr/local/go/bin:$PATH"
# Haskell
export PATH="$HOME/.ghcup/bin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='nvim'

_invoke_script() {
	# shellcheck source=/dev/null
	source "$1"
	local FILENAME="$(basename "$1")"
	if [ $? -eq 0 ]; then
		print "${fg[green]}Run $FILENAME${reset_color}"
	else
		print "${fg[red]}Failed to run $FILENAME${reset_color}"
	fi
	unset -v FILENAME
}

if [ -d "$HOME/scripts" ]; then
	for script in "$HOME/scripts"/**/*; do
		[ -f "$script" ] && _invoke_script "$script"
	done
fi

# WARN: Always last.
_invoke_script "$HOME/init/syntax-highlighting.zsh"

unset -f _invoke_script
