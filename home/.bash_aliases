alias gg='git grep'
alias ga='git add'
alias gp='git push'
alias gc='git commit'
alias gd='git diff'
alias g='git'
alias dos2unix="perl -w015l12pl12pi -e1"
alias mac2unix="perl -w015l12pi -e1"

alias gipython="ipython qtconsole --pylab=inline"
alias ghci="ghci -XNoMonomorphismRestriction"
alias lwatch="w'tch -n 1 wc -l"
alias parallel="parallel --use-cpus-instead-of-cores --no-notice --bar"


function gitsearch() {
    git rev-list --all | (
        while read revision; do
            git grep -F "$1" $revision
        done
    )
}

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


# alias mysql-aurora-dev="mysql -h$AURORA_DEV_HOST -u$DB_USER --port $DB_PORT -p"
# alias ssh-hugemem="ssh -Y $HUGEMEM -i $AWS_KEY -t \"tmux new-session -A -s main\""
# alias mosh-hugemem="mosh --ssh=\"ssh -Y -i $AWS_KEY\" $HUGEMEM --server=\"/usr/bin/mosh-server\" -- tmux new-session -A -s main"
# alias ssh-searle="ssh -Y $SEARLE -t \"tmux new-session -A -s main\""
# alias mosh-searle="mosh --ssh=\"ssh -Y\" $SEARLE --server=\"/usr/bin/mosh-server\" -- tmux new-session -A -s main"
# alias vevo-vpn="sudo openconnect --script=~/.local/etc/vpnc-script-split-traffic -u $VPN_USER --authgroup $VPN_GROUP $VPN_HOST"
