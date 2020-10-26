export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"

# Editors.
export EDITOR="emacsclient -t"        # Default editor.
export GIT_EDITOR="vi"                # Default editor for git tasks.
export ALTERNATE_EDITOR="vi"          # Substitute editor when Emacs is not available.

# Graphics widgets.
export GTK_THEME="Adwaita:dark"       # Dark GTK theme.
export QT_SCALE_FACTOR=3              # Scale QT applications.
export WLR_DRM_NO_MODIFIERS=1         # FIXME: workaround for sway's DPMS bug.

# Miscellaneous.
export DOTNET_CLI_TELEMETRY_OPTOUT=1  # Disable telemetry in .NET compiler.
export LESSHISTFILE="-"               # Disable less history.

# Input method.
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
