export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"

# Editors.
export EDITOR="emacsclient -t"        # Default editor.
export GIT_EDITOR="vi"                # Default editor for git tasks.
export ALTERNATE_EDITOR="vi"          # Substitute editor when Emacs is not available.

# Dark theme.
export GTK_THEME="Adwaita:dark"

# Firefox.
export MOZ_USE_XINPUT2=1              # Touch gestures.
export MOZ_ENABLE_WAYLAND=1           # Enable Wayland support.

# Miscellaneous.
export DOTNET_CLI_TELEMETRY_OPTOUT=1  # Disable telemetry in .NET compiler.
export LESSHISTFILE="-"               # Disable less history.
export QT_SCALE_FACTOR=1.5            # Scale QT applications.
export WLR_DRM_NO_MODIFIERS=1         # FIXME: workaround for sway's DPMS bug.
