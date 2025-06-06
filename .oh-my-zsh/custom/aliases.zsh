#!/usr/bin/env sh

alias c="clear && history -p"
alias g="git"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
# TODO: Check `lsd` config file.
alias ls2="lsd -AFl --tree --depth=2 --total-size --group-directories-first --blocks=user,size,name,links,git --hyperlink=always"
alias ls="lsd -AFl --total-size --group-directories-first --blocks=user,size,name,links,git --hyperlink=always"
alias lsIng="lsd -AFl --tree --depth=2 --total-size --group-directories-first --blocks=user,size,name,links,git -I .git -I node_modules --hyperlink=always"
alias n="nvim"
alias t1='tree -aFpsu -L 1'
alias t2='tree -aFpsu -L 2'
alias wget-staticweb='wget --convert-links --mirror --page-requisites --no-clobber --no-parent --domains'
alias y='yazi'
