export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"

export EDITOR="emacsclient -t"        # Default editor.
export GIT_EDITOR="vi"                # Default editor for git tasks.
export ALTERNATE_EDITOR="vi"          # Substitute editor when Emacs is not available.

export DOTNET_CLI_TELEMETRY_OPTOUT=1  # Disable telemetry in .NET compiler.
export LESSHISTFILE="-"               # Disable less history.

# Wayland options.
export MOZ_ENABLE_WAYLAND=1           # Enable Wayland support in Firefox.
export WLR_DRM_NO_MODIFIERS=1         # FIXME: workaround for sway's DPMS bug.

# Dark theme.
export GTK_THEME="Adwaita:dark"
export QT_STYLE_OVERRIDE="Adwaita-dark"
