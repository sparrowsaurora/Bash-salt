function tree() {
    current_dir=$(pwd)
    echo "$1"
    echo "$current_dir"
    if [ "$1" == "-f" ]; then
        python ~/source/repos/Bash-salt/src/tree/tree.py "$1" "$current_dir"
    else
        python ~/source/repos/Bash-salt/src/tree/tree.py "$current_dir"
    fi
}
