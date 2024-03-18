# how to dotfiles

## absolutley needed dependencies
```
pacman -S git stow
```
## other needed dependencies for hyprland
```
paru -S nvim squeekboard aerc w3m dante alacritty mc fzf zsh-fzf-plugin-git dunst wofi lazygit
```
# restore
## clone repo
`git clone https://github.com/FearlessSpiff/dotfiles.git`
## symlink with stow in repo dir
`stow -t /home/<username> .`

# add new dotfile/dir
* add it to repo
* then restow with `stow -R -t /home/<username> .`

## nice stow docu
* https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow

# wvkbd dracula theme
* checkout https://github.com/jjsullivan5196/wvkbd
* copy `./wvkbd/config.h` to checkout location
* `sudo make install`
