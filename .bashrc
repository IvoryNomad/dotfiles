# .bashrc

# Source global definitions
if [[ -f "/etc/bashrc" && -r "/etc/bashrc" ]]; then
    source "/etc/bashrc"
fi

# User specific aliases and functions

if [ -n "${PS1}" ]; then
    export HISTCONTROL=ignoreboth

    # append to the history file, don't overwrite it
    shopt -s histappend

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "${TERM}" in
        xterm-color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    force_color_prompt=yes

    if [ -n "${force_color_prompt}" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            # We have color support; assume it's compliant with Ecma-48
            # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
            # a case would tend to support setf rather than setaf.)
            color_prompt=yes
        else
            color_prompt=
        fi
    fi

    if [ "${color_prompt}" = yes ]; then
        PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "${TERM}" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]${PS1}"
        ;;
    *)
        ;;
    esac

    if [[ -f ~/.bash_aliases && -r ~/.bash_aliases  ]]; then
        source ~/.bash_aliases
    fi

    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        eval "$(/usr/bin/dircolors -b)"
    fi

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [[ -f /etc/bash_completion && -r /etc/bash_completion ]]; then
        source /etc/bash_completion
    fi

    # Uncomment if you want sbin in your PATH
    #PATH=/sbin:/usr/sbin:${PATH}

    # Make ls -l and friends make sense
    export LC_COLLATE=C

    # Uncomment (and edit) to set your editor. This is pretty useful when
    # git and friends spawn an editor on your behalf
    export EDITOR=/usr/bin/vim

    # don't logout on ctrl-d
    set -o ignoreeof
fi

# Add homedir bin to PATH
if [ -d ~/.local/bin ]; then
    PATH=~/.local/bin:"${PATH}"
fi

# load SSH agent
if [[ -f ~/.use-ssh-agent && -r ~/.use-ssh-agent ]]; then
    source ~/.use-ssh-agent
fi

if [ -f ~/.cargo/env ]; then
    source ~/.cargo/env
fi
