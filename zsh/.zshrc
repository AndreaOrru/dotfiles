# FZF.
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS="--exact"

# Syntax highlighting.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Aliases.
alias diff='diff --color=auto'
alias f='sudo updatedb && sudo locate -i'
alias i='ipython'
alias p='yay'
alias pinit='pip install -r requirements.txt; \
	     pip install -r requirements-dev.txt; \ 
	     pre-commit install'
