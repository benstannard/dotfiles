# Configs and dotfiles for new machines
You can run bash.build script or manually create symbolic links to files.
` $ ln -s ~$HOME/dotfiles/bashrc ~/.bashrc `

### VIM
[vim-plug](https://github.com/junegunn/vim-plug)  
Download plug.vim and put it in the "autoload" directory .vim/autoload.
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### BASH
[bat / batcat](https://github.com/sharkdp/bat) upgrade of `cat`. mapped to **`r`**.  
[ripgrep](https://github.com/BurntSushi/ripgrep/blob/master/README.md#installation) alternative to `grep`, mapped to **`s`**.  
```
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

[fdfind](https://github.com/sharkdp/fd) alternative to `find`. mapped to **`f`**.  

[exa](https://github.com/ogham/exa) alternative to `ls`. mapped to **`e`**.  

[fzf](https://github.com/junegunn/fzf) upgrade `CTRL-R` bash history search.   
```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

[git-delta](https://github.com/dandavison/delta/releases) upgrade `git diff`.  
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
