source ~/.profile

# Extra autocompletions.
fpath+=~/.zfunc

# Editors.
export EDITOR="emacsclient -t"        # Default editor.
export GIT_EDITOR="vi"                # Default editor for git tasks.
export ALTERNATE_EDITOR="vi"          # Substitute editor when Emacs is not available.

# Miscellaneous.
export DOTNET_CLI_TELEMETRY_OPTOUT=1  # Disable telemetry in .NET compiler.
export LESSHISTFILE="-"               # Disable less history.
