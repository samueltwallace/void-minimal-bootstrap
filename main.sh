#!/bin/bash


echo "If you've gotten this far, you probably have git installed. If not, quit and do that now!"

sudo xbps-install -Su
cd $HOME

# INSTALL 

sudo xbps-install ImageMagick
sudo xbps-install alacritty
sudo xbps-install bspwm
sudo xbps-install feh
sudo xbps-install firefox
sudo xbps-install font-hack-ttf
sudo xbps-install fzf
sudo xbps-install i3lock-fancy
sudo xbps-install julia
sudo xbps-install lightdm
sudo xbps-install neofetch
sudo xbps-install polybar
sudo xbps-install pulseaudio
sudo xbps-install python
sudo xbps-install python3
sudo xbps-install python3-pip
sudo xbps-install pywal
sudo xbps-install rofi
sudo xbps-install sxhkd
sudo xbps-install texlive-bin
sudo xbps-install xdg-user-dirs
sudo xbps-install xorg
sudo xbps-install zathura
sudo xbps-install zsh
sudo xpbs-install compton
sudo xpbs-install curl
sudo xpbs-install neovim


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
BOOTSTRAP_REPO="$(find $HOME -name void-minimal-bootstrap)"
cd $BOOTSTRAP_REPO

cp -r ./Desktop/rofi/ $HOME/.config/
cp ./Desktop/SolidBlack.png $HOME/Pictures/SolidBlack.png
cp ./Desktop/bspwmrc $HOME/.config/bspwm/
cp ./Desktop/compton.conf $HOME/.config/compton.conf
cp ./Desktop/polybar.config $HOME/.config/poybar/config
cp ./Desktop/sxhkdrc $HOME/.config/sxhkdrc
cp ./Terminal/aliases $HOME/.aliases
cp ./Terminal/nvim/commands.vim $HOME/.config/nvim/commands.vim
cp ./Terminal/nvim/init.vim $HOME/.config/nvim/init.vim
cp ./Terminal/nvim/interface.vim $HOME/.config/nvim/interface.vim
cp ./Terminal/zshrc $HOME/.zshrc

git clone https://github.com/GideonWolfe/Zathura-Pywal.git
cd Zathura-Pywal
./install.sh
cd ..

echo "Enter 0 when zsh prompts, then exit. Press Enter when ready to continue"
echo ' '
echo ' '
read PLACEHOLDER
zsh

# Change shell to zsh
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
