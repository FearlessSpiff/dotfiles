# How to dotfiles

## Absolutley needed dependencies

```bash
pacman -S git stow
```

## Other needed dependencies for hyprland

```bash
paru -S neovim ttf-rains-mono-nerd aerc w3m dante alacritty mc fzf zsh-fzf-plugin-git dunst wofi lazygit iio-sensor-proxy iio-hyprland-git wf-recorder slurp grim hyprland hyprlock hyprpaper hypridle waybar blueman pavucontrol github-cli brightnessctl cliphist kanshi
```

## Restore

### Clone repo

`git clone https://github.com/FearlessSpiff/dotfiles.git`

### Symlink with stow in repo dir

`stow -t /home/<username> .`

## Hints

### Add new dotfile/dir

* add it to repo
* then restow with `stow -R -t /home/<username> .`

### Nice stow docu

* <https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow>

### Set wvkbd dracula theme

* checkout <https://github.com/jjsullivan5196/wvkbd>
* copy `./do-not-stow/wvkbd/config.h` to checkout location
* `sudo make install`
