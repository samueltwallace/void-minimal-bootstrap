#!/bin/bash


echo "If you've gotten this far, you probably have git installed. If not, quit and do that now!"

sudo xbps-install -Su
cd $HOME

# INSTALL 

sudo xbps-install ImageMagick
sudo xbps-install alacritty
sudo xbps-install alsa
sudo xbps-install alsa-utils
sudo xbps-install bspwm
sudo xbps-install curl
sudo xbps-install feh
sudo xbps-install ffmpeg
sudo xbps-install firefox
sudo xbps-install font-hack-ttf
sudo xbps-install fzf
sudo xbps-install gcc
sudo xbps-install i3lock-fancy
sudo xbps-install lightdm
sudo xbps-install lightdm-gtk3-greeter
sudo xbps-install make
sudo xbps-install neofetch
sudo xbps-install neovim
sudo xbps-install nodejs
sudo xbps-install picom
sudo xbps-install polybar
sudo xbps-install pulseaudio
sudo xbps-install python
sudo xbps-install python3
sudo xbps-install python3-devel
sudo xbps-install python3-pip
sudo xbps-install pywal
sudo xbps-install ripgrep
sudo xbps-install rofi
sudo xbps-install ruby
sudo xbps-install scrot
sudo xbps-install sxhkd
sudo xbps-install texlive-bin
sudo xbps-install vifm
sudo xbps-install xdg-user-dirs
sudo xbps-install xorg
sudo xbps-install xsel
sudo xbps-install zathura
sudo xbps-install zathura-pdf-poppler
sudo xbps-install zsh

sudo pip3 install pynvim

sudo npm install -g neovim

# Put in home directories
xdg-user-dirs-update

# Create directories
mkdir $HOME/.config
cd .config
mkdir bspwm
mkdir sxhkd
mkdir nvim
mkdir alacritty
mkdir polybar

# Create configs
BOOTSTRAP_REPO="$(find $HOME -name void-minimal-bootstrap)"
cd $BOOTSTRAP_REPO


cp -r ./Desktop/rofi/ $HOME/.config/
cp ./Desktop/SolidBlack.png $HOME/Pictures/SolidBlack.png
cp ./Desktop/bspwmrc $HOME/.config/bspwm/
cp ./Desktop/compton.conf $HOME/.config/compton.conf
cp ./Desktop/polybar.config $HOME/.config/polybar/config
cp ./Desktop/sxhkdrc $HOME/.config/sxhkd/
cp ./Desktop/xinitrc $HOME/.xinitrc
cp ./Terminal/aliases $HOME/.aliases
cp ./Terminal/nvim/commands.vim $HOME/.config/nvim/commands.vim
cp ./Terminal/nvim/init.vim $HOME/.config/nvim/init.vim
cp ./Terminal/nvim/interface.vim $HOME/.config/nvim/interface.vim
cp ./Terminal/nvim/vimplug.vim $HOME/.config/nvim/vimplug.vim




sudo cp ./Desktop/VoidLogo.png /usr/share/pixmaps/
sudo cp ./Desktop/lightdm-gtk-greeter.conf /etc/lightdm

cd ..
git clone https://github.com/GideonWolfe/Zathura-Pywal.git
cd Zathura-Pywal
./install.sh
cd ..

git clone https://github.com/powerline/font.git --depth=1
fonts/install.sh
ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.conf
fc-cache -fv

chmod +x bspwm/bspwmrc
chmod +x rofi/wifi.sh
chmod +x rofi/pdf.sh


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp -f ./Terminal/zshrc $HOME/.zshrc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -es :PlugInstall

curl -o $HOME/.oh-my-zsh/themes/gitster.zsh-theme https://raw.githubusercontent.com/shashankmehta/dotfiles/master/thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme
git clone https://www.github.com/brokendisk/dune-quotes.git ~/.oh-my-zsh/custom/plugins/dune-quotes

sudo ln -s /etc/sv/lightdm /var/service/lightdm
sudo ln -s /etc/sv/dbus /var/service/dbus
sudo reboot
