#!/bin/bash


echo "If you've gotten this far, you probably have git installed. If not, quit and do that now!"

cd $HOME
GITURL="https://github.com/samueltwallace/void-minimal-bootstrap.git"
git clone $GITURL # makes folder void-minimal-bootstrap

# INSTALL 
sudo xbps-install xorg
sudo xbps-install xdg-user-dirs
sudo xbps-install alacritty
sudo xbps-install bspwm
sudo xbps-install sxhkd
sudo xbps-install neofetch
sudo xpbs-install neovim
sudo xbps-install feh
sudo xbps-install zsh
sudo xpbs-install curl
sudo xbps-install fzf
sudo xbps-install python3
sudo xbps-install pulseaudio
sudo xbps-install firefox
sudo xpbs-install compton
sudo xbps-install polybar
sudo xbps-install zathura
sudo xbps-install texlive-bin
sudo xbps-install julia
pip3 install pywal

# Put in home directories
xdg-user-dirs-update

# Create directories
mkdir $HOME/.config
cd .config
mkdir bspwm
mkdir sxhkd
mkdir nvim
mkdir alacritty

# Create configs
cp $HOME/void-minimal-bootstrap/Terminal/aliases $HOME/.aliases
cp $HOME/void-minimal-bootstrap/Terminal/zshrc $HOME/.zshrc
cp $HOME/void-minimal-bootstrap/Desktop/bspwmrc $HOME/.config/bspwm/
cp $HOME/void-minimal-bootstrap/Desktop/sxhkdrc $HOME/.config/sxhkdrc
cp $HOME/void-minimal-bootstrap/Desktop/polybar.config $HOME/.config/poybar/config
cp $HOME/void-minimal-bootstrap/Desktop/compton.conf $HOME/.config/compton.conf
cp $HOME/void-minimal-bootstrap/Desktop/SolidBlack.png $HOME/Pictures/SolidBlack.png

# Change shell to zsh
chsh -s /bin/zsh

echo "Enter 0 when zsh prompts, then exit. Press Enter when ready to continue"
read PLACEHOLDER
zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
