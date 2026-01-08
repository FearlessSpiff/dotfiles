# How to dotfiles

## Install archlinux

* Use `archinstall` with Desktop gnome install (Still use Gnome to check progress)
* Reboot and then in Gnome
* Install bare minimum: `pacman -S git stow`
* Clone this repo and stow it

```bash
git clone https://github.com/FearlessSpiff/dotfiles.git
cd dotfiles
git clone https://github.com/FearlessSpiff/dotfiles.git
stow -t /home/<username> .
```

* Install paru

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

* Install the rest

```bash
paru -S git-zsh-completion github-cli lazygit openssh nvim alacritty ttf-jetbrains-mono-nerd inter-font wl-clipboard quickshell-git dms-shell-bin cava cliphist i2c-tools matugen qt6-multimedia qt6ct greetd-dms-greeter-git zen-browser-bin

```

* Enable greetd-dms-greeter (Caution, Gnome needs gdm because it uses it as lockscreen. If Gnome is used more, switch to gdm!)

```bash
dms greeter enable
dms greeter sync
```

TODO: cleanup down here

## Absolutely needed dependencies

```bash
pacman -S git stow
```

## Other needed dependencies for hyprland

```bash
paru -S davfs2 zsh neovim ttf-font-awesome ttf-jetbrains-mono-nerd otf-commit-mono-nerd dante alacritty mc fzf zsh-fzf-plugin-git dunst wofi lazygit  wf-recorder slurp grim hyprland hyprlock hyprpaper hypridle hyprshot waybar xdg-desktop-portal-hyprland blueman pavucontrol github-cli brightnessctl cliphist kanshi pam_mount gnome-browser-connector power-profiles-daemon ripgrep ags-hyprpanel-git btop kitty niri xwayland-satellite dms-shell-bin matugen
```

## Webdav automount

* Copy davfs2 config: `cp /etc/davfs2/davfs2.conf ~/.davfs2/`
* Creat davfs2 secrets (Google it)
* Use examples under systemd/user
* Enable/start only xyz.automount
* Add fstab entry: `https://owncloud.server.ch/remote.php/dav/files/user/ /home/user/Owncloud davfs user,noauto,uid=1000,gid=1000,file_mode=0644,dir_mode=0755 0 0`
* Add user to network group: `sudo usermod -aG network user`
* Log out/in

## Niri quirks

* If not found in aur install <https://github.com/Zhaith-Izaliel/iio-niri>

## New stuff for hyprpanel

sudo pacman -S dart-sass swww
paru -S grimblast-git gpu-screen-recorder hyprpicker matugen-bin python-gpustat aylurs-gtk-shell-git

## Fancy stuff

```bash
paru -S aerc w3m iio-sensor-proxy iio-hyprland-git
```

## After install

* Set physical button to suspend: <https://github.com/hyprwm/Hyprland/issues/2614>
* Unmmute "Output Devices" in pavucontrol

## Restore

### Clone repo

`git clone https://github.com/FearlessSpiff/dotfiles.git`

### Symlink with stow in repo directory

`stow -t /home/<username> .`

## Hints

### Add new dotfile/directory

* add it to repo
* then restow with `stow -R -t /home/<username> .`

### Nice stow docu

* <https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow>

### Set wvkbd dracula theme

* checkout <https://github.com/jjsullivan5196/wvkbd>
* copy `./do-not-stow/wvkbd/config.h` to checkout location
* `sudo make install`

### Make brightness work in gamescope-session-steam

* Just add the user to the video group an configure this udev rule: <https://wiki.archlinux.org/title/Backlight#ACPI>

### Install gamescope-session-steam

* Enable multilib
* sudo pacman -S steam (select lib32-vulkan-radeon)
* paru -S gamescope-session-steam-git

### Fix Zen/Firefox scrolling

* Go to `about:config`
* disable `apz.gtk.kinetic_scroll.enabled`
