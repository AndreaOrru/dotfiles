#!/bin/sh

DEV="$HOME/dev/makepkg"
EMACS="$DEV/emacs-pgtk-native-comp-git"
PLS="$DEV/python-language-server"
mkdir -p "$DEV"


#######################
#  Emacs executable.  #
#######################

[ ! -d "$EMACS" ] && yay -G emacs-pgtk-native-comp-git

cd "$EMACS"
rm -rf pkg src *.pkg.tar

git reset --hard
git pull

makepkg -si --noconfirm
rm -rf pkg src *.pkg.tar


##########################
#  Emacs configuration.  #
##########################

rm -rf ~/.emacs.d/elpa
rm -rf ~/.emacs.d/etc
rm -rf ~/.emacs.d/var
rm -rf ~/.emacs.d/vendor

systemctl --user daemon-reload


######################################
#  Microsoft Python Language Server  #
######################################

[ ! -d "$PLS" ] && git clone Microsoft/python-language-server

cd "$PLS/src/LanguageServer/Impl"
git pull
dotnet publish -c Release -r arch-x64
ln -vsf "$PLS/output/bin/Release/arch-x64/publish/Microsoft.Python.LanguageServer" ~/bin
