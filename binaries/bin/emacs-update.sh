#!/bin/sh

mkdir -p ~/dev/makepkg
[ ! -d "$HOME/dev/makepkg/emacs27-git" ] && yay -G emacs27-git

cd ~/dev/makepkg/emacs27-git
rm -f emacs27-git-*
rm -rf pkg src

git reset --hard
git pull
sed -i 's/^NOTKIT=     /NOTKIT="YES"/' PKGBUILD
sed -i 's/^LTO=     /LTO="YES"/' PKGBUILD

makepkg -si --noconfirm
rm -rf pkg src

rm -rf ~/.emacs.d/elpa
rm -rf ~/.emacs.d/etc
rm -rf ~/.emacs.d/var

systemctl --user daemon-reload
