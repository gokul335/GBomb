#!/bin/bash

detect_distro() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        elif [ "$OSTYPE" == "darwin" ]; then
            distro="darwin"
        else 
            distro="invalid"
        fi
    fi
}

pause() {
    read -n1 -r -p "Press any key to continue..." key
}
banner() {
    clear
    echo -e "\e[1;31m"
    if ! [ -x "$(command -v figlet)" ]; then
        echo 'Introducing GBomb'
    else
        figlet GBomb
    fi
    if ! [ -x "$(command -v toilet)" ]; then
        echo -e "\e[4;34m This Bomber Was Created By \e[1;32mDEVIL Hacker \e[0m"
    else
        echo -e "\e[1;34mCreated By \e[1;34m"
        toilet -f mono12 -F border GOKUL
    fi
    echo -e "\e[1;34m For Any Queries Join Me!!!\e[0m"
    echo -e "\e[1;32m           Telegram: https://t.me/joinchat/f3fXLkvaxk1hYTM9 \e[0m"
    echo -e "\e[4;32m   YouTube: https://youtube.com/channel/UC9ofsudj2myT2E84Mb-Lmlw \e[0m"
    echo " "

}

init_environ(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

    INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        PYTHON="python"
        SUDO=""
    else
        PYTHON="python3"
        SUDO="sudo"
    fi
    PIP="$PYTHON -m pip"
}

install_deps(){
    
    packages=(openssl git $PYTHON  figlet toilet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
        $PIP install -r requirements.txt
    else
        echo "We could not install dependencies."
        echo "Please make sure you have git, python3, pip3 and requirements installed."
        echo "Then you can execute Gbomb.py ."
        exit
    fi
}

banner
pause
detect_distro
init_environ
if [ -f .update ];then
    echo "All Requirements Found...."
else
    echo 'Installing Requirements....'
    echo .
    echo .
    install_deps
    echo This Script Was Made By Gokul > .update
    echo 'Requirements Installed....'
    pause
fi
while :
do
    banner
    echo -e "\e[4;31m Please Read Instruction Carefully !!! \e[0m"
    echo " "
    echo "Press 1 To  Start SMS  Bombing "
    echo "Press 2 To  Start CALL Bombing "
    echo "Press 3 To  Start MAIL Bombing "
     echo "Press 4 To  Whatsapp Bombing ( Coming Now) "
    echo "Press 5 To  Update (Works On Linux And Linux Emulators) "
    echo "Press 6 To  Exit "
    read ch
    clear
   if [ $ch -eq 1 ];then
        echo -e "\e[1;34m        wait please"
        echo -e "\e[1;32m   Subscribe DEVIL  Hacker Youtube Channel"
        sleep 5
        cd $HOME
        cd Gbomb
        python3 Gbomber.py
       
        exit
    elif [ $ch -eq 2 ];then
        echo -e "\e[1;34m          wait please"
        echo -e "\e[1;32m    Subscribe DEVIL  Hacker Youtube Channel"
        sleep 5
        cd $HOME
        cd Gbomb
        python3 Gbomber.py
        
        exit
        exit
    elif [ $ch -eq 3 ];then
         echo -e "\e[1;34m        wait please"
        echo -e "\e[1;32m   Subscribe DEVIL  Hacker Youtube Channel"
         sleep 5
         cd $HOME
        git clone https://github.com/ha-mrx/Emailbomb
         cd Emailbomb
        chmod +x Emailbomb.py
        python2 Emailbomb.py

        exit
    elif [ $ch -eq 4 ];then
        echo -e "\e[1;34m            whatsapp bombing coming soon"
        echo -e "\e[1;32m        Subscribe Devil  Hacker Youtube Channel"
        sleep 5
        cd $HOME
        cd Gbomb
        bash GBomb.sh
    elif [ $ch -eq 5 ];then
        echo -e "\e[1;34m Downloading Latest Files..."
        cd $HOME
        rm -rf Gbomb
        git clone https://github.com/gokul335/GBomb
        cd Gbomb
        bash GBomb.sh
       
        exit
    elif [ $ch -eq 6 ];then
        cd $HOME
        exit
        
    else
        echo -e "\e[4;32m Invalid Input !!! \e[0m"
        pause
    fi
done