CopyFile /etc/profile.d/homebin.sh

CopyFile /etc/zsh/zshenv
CopyFile /etc/zsh/zshrc.local

# Start X at login on the NUC.
if [[ "$HOSTNAME" == "toxicity" ]]; then
cat >> "$(GetPackageOriginalFile zsh /etc/zsh/zprofile)" <<'EOF'
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
EOF
fi
