# How to dotfiles

## Absolutely needed dependencies

```bash
pacman -S git stow
```

## Other needed dependencies for hyprland

```bash
paru -S zsh neovim ttf-font-awesome ttf-jetbrains-mono-nerd dante alacritty mc fzf zsh-fzf-plugin-git dunst wofi lazygit  wf-recorder slurp grim hyprland hyprlock hyprpaper hypridle waybar xdg-desktop-portal-hyprland blueman pavucontrol github-cli brightnessctl cliphist kanshi pam_mount
```

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
