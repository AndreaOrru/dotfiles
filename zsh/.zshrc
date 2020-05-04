# FZF integration.
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# Syntax highlighting.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


# Python virtualenvs.
source virtualenvwrapper_lazy.sh
# Automatically activate virtualenvs.
precmd_functions=(auto_workon $precmd_functions)
function auto_workon() {
    if [ "$PWD" != "$PY_OLDPWD" ] && [ -f .venv ]; then
        workon `cat .venv`
        PY_OLDPWD="$PWD"
    fi
}


# Custom grml ZSH prompt.
function virtual_env_prompt () { REPLY=''${VIRTUAL_ENV+ (''${VIRTUAL_ENV:t})} }
grml_theme_add_token virtual-env -f virtual_env_prompt '%F{magenta}' '%f'
zstyle ':prompt:grml:right:setup' items sad-smiley virtual-env
zstyle ':prompt:grml:left:setup' items rc path vcs percent


#
# Aliases
#

# Misc.
alias atril='GTK_THEME=Adwaita:light atril'
alias diff='diff --color=auto'
alias f='sudo updatedb && sudo locate -i'
alias i='ipython'
alias open='xdg-open'
alias p='yay'
alias pastebinit='pastebinit -b paste.debian.net'
alias pipdev='pip install -e ".[dev]"'
alias ta='tmux attach -t'

# Git commands.
alias git='hub'
alias gpush="git push -u origin \`git rev-parse --abbrev-ref HEAD\`"
alias "g.."="cd \`git root\`"

# Text editors.
alias e='emacsclient -t'
alias "e."='emacsclient -t . ..'


#
# Functions
#

t() {
    if [[ -z "$1" ]]; then
        tmux
    else
        tmux attach -t $1 || tmux new-session -s $1
    fi
}

fetchmirrors() {
    sudo sh -c "curl -s 'https://www.archlinux.org/mirrorlist/?country=$1&protocol=https&use_mirror_status=on' | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 - > /etc/pacman.d/mirrorlist"
}


# Automatically source local .envrc files.
eval "$(direnv hook zsh)"
