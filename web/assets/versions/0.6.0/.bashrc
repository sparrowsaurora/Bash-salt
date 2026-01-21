#!/bin/bash

# Custom Functions
function view() {
    cd $1 && ls -a && cd -;
}

function mkcd() {
    mkdir $1 && cd $1;
}

# Script to run startup
function startup() {
    # startup command(s)
    echo "Welcome, $USER!"
}
startup

PROMPT_COMMAND='echo'