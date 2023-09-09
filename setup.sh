#!/bin/bash

echo "dowloading neccesary resources..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "setting up variables...";
wd=`pwd`;

echo "creating ~ configs...";
cp $wd/.gitconfig $HOME/.gitconfig;
cp $wd/.zshrc $HOME/.zshrc;

echo "creating ~/.config configs...";
config_dir=$HOME/.config;
[ ! -d $config_dir ] && mkdir $config_dir || : ;
cp -R $wd/.config/* $config_dir;

#////////////
# setup nvim
#////////////

# vim plugged
autoload_dir=$config_dir/nvim/autoload
[ ! -d  $autoload_dir ] && mkdir $autoload_dir || : ;
curl -fsSL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > $autoload_dir/plug.vim

echo "-- done --"
