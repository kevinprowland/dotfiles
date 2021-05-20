#!/bin/bash

try() {
    temp_output=$(mktemp)
    $* > $temp_output 2>&1
    if [ $? -eq 0 ]; then
        echo "done";
    else
        echo "failed";
        cat $temp_output;
        rm $temp_output;
        exit 1;
    fi
    rm $temp_output
}

echo -n "installing Vundle.. "

if [[ -d ~/.vim/bundle/Vundle.vim ]]; then
    echo "already installed"
else
    try git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo -n "installing Vundle plugins.. "
try vim +PluginInstall +qall

stow vim
