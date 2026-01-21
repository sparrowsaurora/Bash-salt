#!/bin/bash

# Custom Functions
function view() {
    cd $1 && ls -a && cd -;
}

function mkcd() {
    mkdir $1 && cd $1;
}

PROMPT_COMMAND='echo'