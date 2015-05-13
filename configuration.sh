#/bin/bash
# Misc machine configuration settings

# map caps lock to esc key
# ref: http://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# git diff using vimdiff
# ref: http://stackoverflow.com/questions/3713765/viewing-all-git-diffs-with-vimdiff
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
