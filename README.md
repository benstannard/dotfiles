
### Configs and dotfiles for new machines
You can run bash.build script or manually create symbolic links to files.
` $ ln -s ~/dotfiles/bashrc ~/.bashrc `

#### Libraries to download
** ripgrep **
[install](https://github.com/BurntSushi/ripgrep/blob/master/README.md#installation)
`
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
`

** fzf **
[install](https://github.com/junegunn/fzf#installation)
`
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
`

