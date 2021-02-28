# load common settings
source "${HOME}/.zsh/rc_common"

# load platform-dependent settings
case `uname` in
    Darwin)
        source "${HOME}/.zsh/rc_osx"
    ;;
    Linux)
        source "${HOME}/.zsh/rc_linux"
    ;;
esac

# load machine-dependent settings
if [ -f "${HOME}/.zsh/rc_host_$(hostname)" ]; then
    source "${HOME}/.zsh/rc_host_$(hostname)"
fi

# load inits
for init in ${HOME}/.zsh/inits/*.init; do
    source "${init}"
done

# load aliases
for alias in ${HOME}/.zsh/aliases/*.alias; do
    source "${alias}"
done