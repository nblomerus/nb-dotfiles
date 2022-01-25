#!/bin/sh
echo "###################################################"
echo " Welcome to my first custom install script"
echo " this script install and setups my own custom rice for PopOS!"
echo "###################################################"

echo "\n"
echo "###################################################"
echo "## Update and upgrade PopOS ##"
echo "###################################################" 
sudo apt update -y && sudo apt upgrade -y

echo "\n"
echo "###################################################"
echo "## Install and setup BSPWM##"
echo "###################################################"

sudo apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev -y
cd ~/Downloads
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/bspwm/bspwmrc

echo "/n"
echo "###################################################"
echo "## Install alacritty ##"
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
sudo apt install alacritty -y
mkdir ~/.config/alacritty


echo "\n"
echo "###################################################"
echo "## Install and setup Polybar##"
echo "###################################################"

sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev -y

cd ~/Downloads
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
mkdir ~/.config/polybar
echo "\n"
echo "###################################################"
echo "## Install and setup Picom##"
echo "###################################################"

sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson -y

cd ~/Downloads
git clone https://github.com/yshui/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install


echo "###################################################"
echo "## Install and setup rofi##"
echo "###################################################"
sudo apt install rofi -y

echo "###################################################"
echo "## Install and setup feh for wallpapers##"
echo "###################################################"
sudo apt install feh -y

echo "###################################################"
echo "## Install and setup ZSH shll##"
echo "###################################################"
sudo apt install zsh -y
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

echo "###################################################"
echo "## Install and setup Neovim##"
echo "###################################################"
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
mv squashfs-root /
rm /usr/bin/nvim
ln -s /squashfs-root/AppRun /usr/bin/nvim
sudo apt-get install ripgrep
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cp -r alacritty nvim polybar bspwm sxhkd ~/.config
cp .zshrc ~/
cp fonts ~/.fonts
