function get_hostname_color() {
    case $(hostname) in
    MacBookM1.local)
        echo "%F{245}"
        ;;
    t420)
        echo "%F{242}"
        ;;
    pc)
        echo "%F{38}"
        ;;
    homeassistant)
        echo "%F{33}"
        ;;
    t530)
        echo "%F{63}"
        ;;
    myszyniec)
        echo "%F{28}"
        ;;
    zbojna)
        echo "%F{125}"
        ;;
    *)
        echo "%F{1}"
        ;;
    esac
}

function get_user() {
    if [ "$EUID" -eq 0 ]; then
        echo "%F{red}$(id -un)%f"
    else
        echo "%F{214}$(id -un)%f"
    fi
}

function get_machine_name() {
    case $(uname) in
    Linux)
        echo "on $(get_hostname_color)$(hostname)%f"
        ;;
    Darwin)
        echo "on $(get_hostname_color)$(scutil --get ComputerName)%f"
        ;;
    esac
}

function get_pwd() {
    echo "in %F{156}%~%f"
}

function get_git() {
    ZSH_THEME_GIT_PROMPT_PREFIX=' at %F{252}git:%f%F{198}'
    ZSH_THEME_GIT_PROMPT_SUFFIX='%f'
    ZSH_THEME_GIT_PROMPT_DIRTY='%F{green}'
    ZSH_THEME_GIT_PROMPT_UNTRACKED='%F{green}?'
    ZSH_THEME_GIT_PROMPT_CLEAN=''

    if git rev-parse --git-dir >/dev/null 2>&1; then
        echo "${ZSH_THEME_GIT_PROMPT_PREFIX}$(git branch --show-current)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    fi
}

#function get_hg() {
#    HG_BRANCH="$(hg prompt '{branch}' 2>/dev/null)"
#    if [ $? = 0 ]; then
#        echo " at %F{252}hg:%f%F{198}${HG_BRANCH}%f"
#    fi
#}

function get_python() {
    VER=$(python -V 2>&1 | tr -d 'Python ')

    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo " in venv:%F{27}${VIRTUAL_ENV:t}%f (%F{26}${VER}%f)"
    fi
}

function get_prompt_char() {
    if [ "$EUID" -eq 0 ]; then
        echo '%F{red}#%f'
    else
        echo '%F{green}$%f'
    fi
}

PROMPT='$(get_user) $(get_machine_name) $(get_pwd)$(get_git)$(get_python)
$(get_prompt_char) '
