#!/bin/bash

reset

echo "Installing my zsh config..."
echo ""

if [ -d ".zsh" ]; then
    echo "You already have some existing zsh configuration,"
    echo "please remove that .zsh directory to continue."
    exit 1
fi

make_dofiles_links() {
    ln -s "${HOME}/.dotfiles/.zsh" "${HOME}/.zsh"
    ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"

    ln -s "${HOME}/.dotfiles/.gitconfig" "${HOME}/.gitconfig"
}

install_mac() {
    # install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # install some important zsh-related stuff
    brew install zsh zsh-autosuggestions zsh-syntax-hightlighting fzf

    # install basics
    brew install htop mc curl wget git

    # install oh-my-zsh
    git clone "https://github.com/ohmyzsh/ohmyzsh.git" $HOME/.oh-my-zsh

    # my files
    git clone "https://github.com/mpianka/dotfiles.git" $HOME/.dotfiles
    make_dofiles_links

    # change shell
    sudo chsh -s $(which zsh) $USER

    echo "DONE"
}

install_linux() {
    if command yum 2>/dev/null; then
        echo "this script doesn't support redhat's piece of shit"
        exit 1
    fi

    if [ ! -e '/etc/apt/sources.list' ]; then
        echo "not a redhat's piece of shit, but also doesn't have apt..."
        echo "is that a bsd? i salute you, but you need to do it manually."
        exit 1
    fi

    # install some important zsh-related stuff
    sudo apt install -y zsh zsh-autocompletions zsh-syntax-hightlighting fzf \
        htop mc curl wget git

    # install oh-my-zsh
    git clone "https://github.com/ohmyzsh/ohmyzsh.git" $HOME/.oh-my-zsh

    # my files
    git clone "https://github.com/mpianka/dotfiles.git" $HOME/.dotfiles
    make_dofiles_links

    # change shell
    sudo chsh -s $(which zsh) $USER

    echo "DONE"
}

if [[ $(uname) == 'Darwin' ]]; then
    install_mac
else
    install_linux
fi
