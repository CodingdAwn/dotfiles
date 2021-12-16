#! /bin/bash

###############################################
## install software with apt
## please use sudo privilege
## tips. you can use | tee to redirect to file.txt
## TODO
## 1. 考虑系统的问题 mac linux windows/wsl
###############################################
default_soft_list=("ranger" "ripgrep" "lazygit" "neovim" "fzf")
special_soft_list=(
  "global"
  "ctags"
)

# input params
is_check_apt_update=$1

# achor dir
anchor_dir=$(pwd)
echo "execute dir is: $anchor_dir"

# trancate version.txt
echo "install execute date: $(date)" > version.txt

# mkdir download
user_home=$(eval echo ~${SUDO_USER})
download_dir=${user_home}/download
echo "download dir is: ${download_dir}"
[[ ! -d $download_dir ]] && mkdir -p $download_dir

###############################################
## some soft need update ppa
###############################################
if [[ -z $is_check_apt_update ]]
then
  add-apt-repository ppa:lazygit-team/release -y
  add-apt-repository ppa:neovim-ppa/stable -y
  apt update
fi

function CheckSoftExist() {
  soft_name=$1
  exist_soft=$(dpkg -s "$soft_name" 2>/dev/null | grep Status | grep installed)
  if [[ -z ${exist_soft} ]]
  then
    echo "${soft_name} not exist"
  else
    echo "${soft_name} installed"
  fi
}

# install common soft
for soft_name in ${default_soft_list[@]}
do
  soft_exist=$(CheckSoftExist "${soft_name}")
  echo $soft_exist
  if [[ $soft_exist == *"not exist"* ]]
  then
    # install
    apt install ${soft_name} -y
  fi
  # echo version info to version.txt
  dpkg_info=$(dpkg -s ${soft_name} | grep Version)
  version_info=${dpkg_info/Version/$soft_name}
  echo $version_info >> version.txt
done

# process global
function Install_global() {
  version=$(gtags --version 2>/dev/null)
  if [[ ! -z $version ]]
  then
    echo "gtags really exist"
    versionInfo=$(echo $version | grep -Eo "[0-9]\.[0-9]\.[0-9]")
    echo "gtags: $versionInfo" >> version.txt
    return
  fi
  # install require package
  sudo apt install automake autoconf gperf bison flex libtool libtool-bin libncurses-dev
  # download global tar file

  name="global-6.6.7"
  if [[ ! -f ${download_dir}/global.tar.gz ]]
  then
    cd $download_dir
    curl https://ftp.gnu.org/pub/gnu/global/${name}.tar.gz --output global.tar.gz
  fi

  [ ! -d ${download_dir/global} ] && tar -xvzf global.tar.gz

  cd ${download_dir}/global
  sh reconf.sh
  ./configure
  make
  make install
  versionInfo=$(gtags --version | grep -Eo "[0-9]\.[0-9]\.[0-9]")
  echo "gtags: $versionInfo" >> version.txt
  cd $anchor_dir
}

# process ctags
function Install_ctags() {
  version=$(ctags --version 2>/dev/null)
  if [[ ! -z $version ]]
  then
    echo "ctags really exist"
    versionInfo=$(echo $version | grep -Eo "[0-9]\.[0-9]\.[0-9]")
    echo "ctags: $versionInfo" >> version.txt
    return
  fi

  [ ! -d ${download_dir}/ctags ] && git clone https://github.com/universal-ctags/ctags.git
  cd ${download_dir}/ctags
  ./autogen.sh
  ./configure
  make
  make install # may require extra privileges depending on where to install
  versionInfo=$(ctags --version | grep -Eo "[0-9]\.[0-9]\.[0-9]")
  echo "ctags: $versionInfo" >> version.txt
  cd $anchor_dir
}

# install common soft
for soft_name in ${special_soft_list[@]}
do
  soft_exist=$(CheckSoftExist "${soft_name}")
  if [[ $soft_exist == *"not exist"* ]]
  then
    Install_"${soft_name}"
  fi
done
