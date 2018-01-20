# Srinivas Dhanwada's .bashrc

ENABLE_STARTUP_MESSAGE=1
ENABLE_BASH_COMPLETION_BREW=1
ENABLE_GIT_COMPLETION=1
ENABLE_GIT_PROMPT_DEFINITIONS=1
ENABLE_GLOBAL_BASHRC=1
ENABLE_RUBYVM=1
ENABLE_ALIASES=1

## Startup Message
if [[ -t 0 && "$ENABLE_STARTUP_MESSAGE" = "1" ]]; then
	echo "db   d8b   db d88888b db       .o88b.  .d88b.  .88b  d88. d88888b      "
	echo "88   I8I   88 88'     88      d8P  Y8 .8P  Y8. 88'YbdP\`88 88'          "
	echo "88   I8I   88 88ooooo 88      8P      88    88 88  88  88 88ooooo      "
	echo "Y8   I8I   88 88~~~~~ 88      8b      88    88 88  88  88 88~~~~~      "
	echo "\`8b d8'8b d8' 88.     88booo. Y8b  d8 \`8b  d8' 88  88  88 88.          "
	echo " \`8b8' \`8d8'  Y88888P Y88888P  \`Y88P'  \`Y88P'  YP  YP  YP Y88888P      "
	echo "                                                                       "
	echo " 	                                                                     "
	echo ".d8888. d8888b. d888888b d8b   db d888888b db    db  .d8b.  .d8888. db "
	echo "88'  YP 88  \`8D   \`88'   888o  88   \`88'   88    88 d8' \`8b 88'  YP 88 "
	echo "\`8bo.   88oobY'    88    88V8o 88    88    Y8    8P 88ooo88 \`8bo.   YP "
	echo "  \`Y8b. 88\`8b      88    88 V8o88    88    \`8b  d8' 88~~~88   \`Y8b.    "
	echo "db   8D 88 \`88.   .88.   88  V888   .88.    \`8bd8'  88   88 db   8D db "
	echo "\`8888Y' 88   YD Y888888P VP   V8P Y888888P    YP    YP   YP \`8888Y' YP "
fi

## Homebrew bash_completion package
if [[ -f $(brew --prefix)/etc/bash_completion && "$ENABLE_BASH_COMPLETION_BREW" = "1" ]]; then
    . $(brew --prefix)/etc/bash_completion
fi

## git bash completion setup
if [[ -f ~/.gitbash/git-completion.bash && "$ENABLE_GIT_COMPLETION" = "1" ]]; then
	. ~/.gitbash/git-completion.bash
fi

## git bash prompt definitions
if [[ -f ~/.gitbash/git-prompt.sh && "$ENABLE_GIT_PROMPT_DEFINITIONS" = "1" ]]; then
	. ~/.gitbash/git-prompt.sh
fi

## Source global definitions
if [[ -f /etc/bashrc && "$ENABLE_GLOBAL_BASHRC" = "1" ]]; then
	. /etc/bashrc
fi

## Load RVM into a shell session *as a function*
if [[ "$ENABLE_RUBYVM" = "1" ]]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi 

## User specific aliases and functions

if [[ "$ENABLE_ALIASES" = "1" ]]; then
    
    ### Preferred ls 
    alias ls='ls -FGlAhp'

    ### list current directory recursively
    alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

    ### sort by date (mtime)
    alias lt='ls -ltr'

    ### sort by and show access time
    alias la='ls -ltur'

    ### sort by size
    alias lz='ls -lSr'
    
    ### ls only directories
    alias ld='ls -d */'

    ### ls only Dotfiles
    alias l.='ls -dAFh .[^.]*'

    ### ls Today
    alias lst='ls -hFtal | grep $(date +%Y-%m-%d)'

    ### Preferred less
    alias less='less -FSRXc'

    ### Preferred cd (clear screen, cd, then list) 
    cd() { clear; builtin cd "$@"; eval ls; }

    ### move back a directory
    alias ..='cd ../'

    ### move back 2 directories
    alias ...='cd ../../'

    ### preferred mkdir 
    alias mkdir='mkdir -pv'

    ### preferred top (requires htop to be installed!)
    alias top='htop'

    ### preferred du (requires ncdu to be installed)
    alias du='ncdu'

    ### preferred cp
    alias cp='cp -iv'

    ### preferred mv
    alias mv='mv -iv'

    ### process table search
    alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

    ### Show Path
    alias path='echo -e ${PATH//:/\\n}'

    ### Show ip info
    alias ip='whoami; echo -e \ - Public Facing IP Address: ; curl ipecho.net/plain ; echo ; echo -e \ - Internal IP Address: ; ipconfig getifaddr en0'

    ### open a finder window here
    alias f='open -a Finder ./'

    ### Convert .mov to .gif
    #### source: https://gist.github.com/dergachev/4627207
    gifify() {
        ffmpeg -i $1 -vf scale=800:-1 -r 30 -f image2pipe -vcodec ppm - | convert -delay 5 -layers Optimize -loop 0 - $2
    }

    ### Helpful Dart Aliases
    #### Launch Dartium in checked mode
    alias dartiumc='DART_FLAGS="--checked --load_deferred_eagerly" open /usr/local/bin/dartium'

    #### Run Dart Dev (need to have it activated globally)
    alias ddev='pub run dart_dev'

    #### Clean Pub Dependencies
    alias pubclean='rm -r .pub/ && echo "Removed .pub/"; rm -rf packages/ && echo "Removed packages/"; rm .packages && echo "Removed .packages"; pubcleanlock'

    #### Clean Pub Lock Dependencies
    alias pubcleanlock='git ls-files pubspec.lock --error-unmatch $>/dev/null && echo "Not removing pubspec.lock - it is tracked" || (rm pubspec.lock && echo "Removed pubspec.lock")'

    #### Look for inconsistent dependencies on pub get
    alias pubblame="pub get --packages-dir --verbosity solver | grep 'inconsistent' -A 2 | sed -e 's/\ |//g'"

    #### Look for inconsistent dependencies on pub upgrade
    alias pubupblame="pub upgrade --packges-dir --verbosity solver | grep 'inconsistent' -A 2 | sed -e 's/\ |//g'"

    #### pub get w/ automatic packages dir
    alias pubget='pub get --packages-dir'

    #### pub upgrade w/ automatic packages dir
    alias pubup='pub upgrade --packages-dir'
fi

