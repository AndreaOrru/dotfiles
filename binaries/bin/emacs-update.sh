#!/bin/sh

DEV="$HOME/dev/makepkg"
EMACS="$DEV/emacs27-git"
PLS="$DEV/python-language-server"
mkdir -p "$DEV"


#######################
#  Emacs executable.  #
#######################

[ ! -d "$EMACS" ] && yay -G emacs27-git

cd "$EMACS"
rm -f emacs27-git-*
rm -rf pkg src

git reset --hard
git pull
sed -i 's/^NOTKIT=     /NOTKIT="YES"/' PKGBUILD
sed -i 's/^LTO=     /LTO="YES"/' PKGBUILD

makepkg -si --noconfirm
rm -rf pkg src


##########################
#  Emacs configuration.  #
##########################

rm -rf ~/.emacs.d/elpa
rm -rf ~/.emacs.d/etc
rm -rf ~/.emacs.d/var

systemctl --user daemon-reload


######################################
#  Microsoft Python Language Server  #
######################################

[ ! -d "$PLS" ] && git clone Microsoft/python-language-server

cd "$PLS/src/LanguageServer/Impl"
git pull
dotnet publish -c Release -r arch-x64
ln -vs "$PLS/output/bin/Release/arch-x64/publish/Microsoft.Python.LanguageServer" ~/bin
