# FZF.
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS="--exact"

# Syntax highlighting.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Automatically activate Python virtualenvs.
source virtualenvwrapper_lazy.sh
precmd_functions=(auto_workon $precmd_functions)
function auto_workon() {
    if [ "$PWD" != "$PY_OLDPWD" ] && [ -f .workon ]; then
        workon `cat .workon`
        PY_OLDPWD="$PWD"
    fi
}

# Custom grml-zsh prompt.
function virtual_env_prompt() { REPLY=''${VIRTUAL_ENV+ (''${VIRTUAL_ENV:t})} }
grml_theme_add_token virtual-env -f virtual_env_prompt '%F{magenta}' '%f'
zstyle ':prompt:grml:right:setup' items sad-smiley virtual-env
zstyle ':prompt:grml:left:setup' items rc path vcs percent

# Aliases.
alias diff='diff --color=auto'
alias f='sudo updatedb && sudo locate -i'
alias i='ipython'
alias p='yay'
alias t='tmux'

alias e='emacsclient -t'
alias "e."='emacsclient -t . ..'

alias gpush="git push -u origin \`git rev-parse --abbrev-ref HEAD\`"
alias "g.."="cd \`git root\`"

alias pinit='pip install -r requirements.txt; \
	     pip install -r requirements-dev.txt; \ 
	     pre-commit install'
