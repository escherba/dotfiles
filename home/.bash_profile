SSH_ENV="$HOME/.ssh/environment"

export HOMEBREW_GITHUB_API_TOKEN=0ee26729a282c53e1d88d6158d4db75308224038
export TERM=xterm-256color

export NLTK_DATA="/Users/escherba/dev/py-nlp/var/nltk/data"

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export LESS="-R"
export EDITOR=/usr/local/bin/vim

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Node: do not use `~' shortcut when referring to home directory
# when exporting paths. Instead, use "$HOME" variable.
#
export NODE_PATH="/usr/local/lib/jsctags:$NODE_PATH"
export NODE_PATH="/usr/local/lib/jsctags:$NODE_PATH"

#pkgconfig
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"

#export PYTHONPATH="$(brew --prefix)/lib/python2.7/site-packages:/usr/local/opt/opencv/lib/python2.7/site-packages:$PYTHONPATH"

alias gipython="ipython qtconsole --pylab=inline"
alias ghci="ghci -XNoMonomorphismRestriction"
alias lwatch="w'tch -n 1 wc -l"
alias ms_excel='open -a "Microsoft Excel"'
alias emacs='/Applications/Aquamacs.app/Contents/MacOS/Aquamacs -nw'
alias gg='git grep'
alias ga='git add'
alias gp='git push'
alias gc='git commit'
alias gd='git diff'
alias g='git'

function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\w\$(parse_git_branch) $ "

export ANDROID_HOME="/Applications/Android Studio.app/sdk/"

function findre() { find . -type f -not -wholename '*.git*' -exec egrep -nH "$1" {} \;; }

function gitd() {
    # running gitd -D prefix will remove all branches with that prefix
    git branch | grep -e "^\s*$2" | xargs git branch "$1"
}

function redis_del() {
    # delete Redis keys from database $1 matching pattern $2
    redis-cli -n "$1" --raw keys "$2" | xargs -L1 -I{} redis-cli -n "$1" del {} 1
}

function pdfpextr() {
    # Use Ghostscript to extract a range of pages from a pdf
    # this function uses 3 arguments:
    #     $1 is the first page of the range to extract
    #     $2 is the last page of the range to extract
    #     $3 is the input file
    #     output file will be named "inputfile_pXX-pYY.pdf"
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
       -dFirstPage=${1} \
       -dLastPage=${2} \
       -sOutputFile=${3%.pdf}_p${1}-p${2}.pdf \
       ${3}
}

function joinpdf() {
    # Join a number of pdfs into a single file "merged.pdf"
    result=${1}
    shift
    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=${result} "$@"
}

# http://blog.sinelabs.com/post/57029831523/uwsgi-nginx-mirroring-ubuntu-setup-for-os-x-mountain
function nginxctl {
    if [ $1 == "reload" ]; then
        echo "Unloading Nginx..."
        sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
        wait
        echo "Loading Nginx..."
        sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    elif [ $1 == "unload" ]; then
        echo "Unloading Nginx..."
        sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    elif [ $1 == "load" ]; then
        echo "Loading Nginx..."
        sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    else
        echo "Command $1 unsupported"
    fi
}

export PATH="$HOME/.cabal/bin:$HOME/Library/Haskell/bin:/Library/Haskell/bin:/usr/local/bin:/usr/local/sbin:$PATH"

export GOPATH="/usr/share/go"
export PATH="$PATH:/usr/share/go/bin:/usr/local/go/bin"

export PATH="$PATH:/opt/bin"

# added by Anaconda 2.0.1 installer
export PATH="$HOME/anaconda/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/heroku/bin:/Users/escherba/anaconda/bin:/Users/escherba/Library/Haskell/bin:/Library/Haskell/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/python:/Users/escherba/dev/lfdev/scripts:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Applications/domino:/usr/share/go/bin:/usr/local/go/bin:/opt/bin:/usr/texbin:$PATH"
if [ -e /Users/escherba/dev/lfdev/scripts/rc ]; then source /Users/escherba/dev/lfdev/scripts/rc ; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile
export PYTHONIOENCODING=UTF_8

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PERL_MB_OPT="--install_base $HOME/perl5"; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

export PERL5LIB="$HOME/perl5/lib/perl5"
export PATH="$PATH:$HOME/perl5/bin"

# Load pyenv automatically by adding
# the following to your profile:
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"