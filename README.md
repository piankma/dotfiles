dotfiles
====

![screenshot](https://github.com/mpianka/dotfiles/blob/master/screenshot.png?raw=true)

Prompt is made of:

`{username} on ${machine} in ${directory} at ${git branch} in ${virtualenv}`

Features:
* clean and elegant zsh theme. shows all the needed informations.
* platform-dependent rc files
* machine-dependent rc files
* separated additional init scripts and aliases for quick access with automatic loading, so if you have some pyenv or fzf to init, you can put it in a separate file for a clean setup

Aliases:
* `seba`: aka `source env/bin/activate`, also can run `pyenv activate {dir}`
* `rm` as `trash`
* `upgrade` as a platform-dependent package upgrade script

Requirements:
* Debian-based Linux or macOS machine
* oh-my-zsh
* fzf
* pyenv

Installing:
* `curl https://raw.githubusercontent.com/mpianka/dotfiles/master/install.sh | bash`