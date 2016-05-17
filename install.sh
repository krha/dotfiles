#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="bashrc tmux.conf vimrc vim bash_profile"    # list of files/folders to symlink in homedir

##########

# fetching Vundle using submodule
git submodule update --init --recursive

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Creating symlink to $file in home directory."
for file in $files; do
    mv ~/.$file $olddir
    ln -s $dir/$file ~/.$file
done

# fetching Vundle Plugins
vim +PluginInstall! +qa
