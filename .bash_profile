# Srinivas Dhanwada's .bash_profile

# Setup the aliases and functions
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# User specific environment and startup programs

    ## Set go path (for development with go)
    export GOPATH="$HOME/go"

    ## Set path for Node Version Manager
    export NVM_DIR="$HOME/.nvm"
    source "$(brew --prefix nvm)/nvm.sh"

    ## Add ruby vm bin to PATH (for development with ruby)
    export PATH="$PATH:$HOME/.rvm/bin"

    ## Add user bin folder to PATH (for misc user executables)
    export PATH="$PATH:$HOME/bin"

    ## Add hidden user local bin folder (for misc user executables)
    export PATH="$PATH:$HOME/.local/bin"

    ## Add composer's bin to PATH (for development with PHP)
    export PATH="~/.composer/vendor/bin:$PATH"

    ## Add dart bin to PATH (for development with dart)
    export PATH="$PATH:/usr/local/opt/dart/bin"

    ## Add pub bin to PATH (for globally installed dart packages)
    export PATH="$PATH":"~/.pub-cache/bin"

    ## Add go bin to PATH (for installed go packages)
    export PATH="$PATH":"$GOPATH/bin"

    ## Add XC toolchain bin to PATH
    export PATH="$PATH:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin"

# Specify default blocksize
export BLOCKSIZE=1K

# Specify the preferred terminal
export TERM=xterm-256color

# Enable CLI colors
export CLICOLOR=1

# Specify color format for ls
export LSCOLORS=ExFxCxDxBxegedabagacad

# Specify th preferred editor
export EDITOR=/usr/bin/vim

# Specify the preferred prompt (git prompt integration)
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='================================================================================\n| $(uname) \w$(__git_ps1 " (%s)")\n| ~> '
export PS2='| ~> '
