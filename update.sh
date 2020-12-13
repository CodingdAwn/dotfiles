#!/bin/bash

# update my repositories
zshPath=~/dotfiles
wikiPath=~/vimwiki
vimPath=~/.vim/vim-init

##########################################
# git status
##########################################
Status()
{
  cd $zshPath
  echo "current dir is $zshPath"
  git status
  
  cd $wikiPath
  echo "current dir is $wikiPath"
  git status
  
  cd $vimPath
  echo "current dir is $vimPath"
  git status
}

##########################################
# git pull
##########################################
Pull()
{
  cd $zshPath
  echo "current dir is $zshPath"
  git pull --rebase
  
  cd $wikiPath
  echo "current dir is $wikiPath"
  git pull --rebase
  
  cd $vimPath
  echo "current dir is $vimPath"
  git pull --rebase
}

##########################################
# help
##########################################
Help()
{
  echo "#############################"
  echo "this script is to do some git operates"
  echo 
  echo "-h        print this"
  echo "-s        go dirs and git status"
  echo "-p        go dirs and git pull"
  echo "-push     not necessary, maybe in future"
  echo "-commit   not necessary, maybe in future"
  echo 
  echo "#############################"
}

##########################################
# main
##########################################
if [[ -z "$1" ]]
then
  echo "need a param, please input a operate"
  Help
  exit
fi

while getopts "hsp" param; do
  case "${param}" in
    s)
      Status
      exit;;
    p)
      Pull
      exit;;
    h | *)
      Help
      exit;;
  esac
done
