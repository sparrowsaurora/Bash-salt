[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Custom Functions
function view() {
    cd $1 && ls -a && cd -;
}

function mkcd() {
    mkdir $1 && cd $1;
}

function gf() {
    git add .
    git commit -m "$1"
    git push
}

function rollback() {
    git reset HEAD^
    git push origin HEAD --force
}

# Script to run startup
function startup() {
    # startup command(s)
    echo "Welcome, $USER!"
}
startup

PROMPT_COMMAND='echo'