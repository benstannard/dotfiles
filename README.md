# Configs and dotfiles for new machines
You can run bash.build script or manually create symbolic links to files.  
` $ ln -s ~/dotfiles/bashrc ~/.bashrc `

### VIM libraries
**vim-plug**. [source](https://github.com/junegunn/vim-plug)  
Download plug.vim and put it in the "autoload" directory .vim/autoload.  
`$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim `  

### BASH libraries
**bat / batcat** upgrade of `cat`. mapped to **`r`**. [source](https://github.com/sharkdp/bat).  
`$ sudo apt install bat`  
Package will be installed as `batcat`, see .bashrc. I create a one-key alias **r** to use: `alias r='batcat --color=never '`  

**ripgrep** alternative to `grep`, mapped to **`s`**. [source](https://github.com/BurntSushi/ripgrep/blob/master/README.md#installation).  
```
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

**fdfind** alternative to `find`. mapped to **`f`**. [source](https://github.com/sharkdp/fd#installation).  

**exa** alternative to `ls`. mapped to **`e`**. [source](https://github.com/ogham/exa)  

**fzf** upgrade `CTRL-R` bash history search. [source](https://github.com/junegunn/fzf#installation).
```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

**git-delta** upgrade `git diff`. [source](https://github.com/dandavison/delta/releases).
```
$ curl -LO <new-release>
$ sudo dpkg -i new-release-file.deb
```

### TODO: Libraries that look fun
+ [nnn](https://github.com/jarun/nnn)
+ [entr](https://github.com/eradman/entr)
+ [lazydocker](https://github.com/jesseduffield/lazydocker)
+ [mdp](https://github.com/visit1985/mdp)
+ [glow](https://github.com/charmbracelet/glow)
+ [broot](https://github.com/Canop/broot)
+ [bottom](https://github.com/ClementTsang/bottom)
+ [xh](https://github.com/ducaale/xh)
