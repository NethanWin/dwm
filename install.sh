# dwm
sudo pacman -Syyu
sudo pacman -S --noconfirm base-devel git libx11 libxft libxinerama xorg-server xorg-xinit terminus-font
sudo mkdir -p ~/.local/src

sudo cp -r st ~/.local/src/
sudo cp -r dwm ~/.local/src/
sudo cp -r dmenu ~/.local/src/
sudo cp -r dwmblocks ~/.local/src/

# st
cd ~/.local/src/st
sudo make clean
sudo make install

# dmenu
cd ~/.local/src/dmenu
sudo sed -i 's/^XINERAMALIBS/# XINERAMALIBS  = -lXinerama/' config.mk
sudo sed -i 's/^XINERAMAFLAGS/# XINERAMAFLAGS = -DXINERAMA/' config.mk
sudo make clean
sudo make install

# dwm
cd ~/.local/src/dwm
sudo sed -i 's/^XINERAMALIBS/# XINERAMALIBS  = -lXinerama/' config.mk
sudo sed -i 's/^XINERAMAFLAGS/# XINERAMAFLAGS = -DXINERAMA/' config.mk
sudo make clean
sudo make install

sudo mkdir -p /usr/share/xsessions
sudo touch /usr/share/xsessions/dwm.desktop

sudo sh -c 'echo "[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession" > /usr/share/xsessions/dwm.desktop'

echo "exec dwm" >~/.xinitrc
