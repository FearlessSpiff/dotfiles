# How to dotfiles

## Install archlinux

With arch-install as desktop with gnome

## Absolutely needed dependencies

```bash
pacman -S git stow
```

## Other needed dependencies for hyprland

```bash
paru -S zsh neovim ttf-font-awesome ttf-jetbrains-mono-nerd otf-commit-mono-nerd dante alacritty mc fzf zsh-fzf-plugin-git dunst wofi lazygit  wf-recorder slurp grim hyprland hyprlock hyprpaper hypridle hyprshot waybar xdg-desktop-portal-hyprland blueman pavucontrol github-cli brightnessctl cliphist kanshi pam_mount gnome-browser-connector power-profiles-daemon ripgrep ags-hyprpanel-git btop kitty niri xwayland-satellite
``

## New stuff for hyprpanel

sudo pacman -S dart-sass swww
paru -S grimblast-git gpu-screen-recorder hyprpicker matugen-bin python-gpustat aylurs-gtk-shell-git

## Fancy stuff

```bash
paru -S aerc w3m iio-sensor-proxy iio-hyprland-git

## After install

* Set physical button to suspend: https://github.com/hyprwm/Hyprland/issues/2614
* Unmmute "Output Devices" in pavucontrol
```

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
