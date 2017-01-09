#!/bin/bash
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;11m"
COL_GREEN=$ESC_SEQ"32;11m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_YELLOW=$ESC_SEQ"33;11m"

function greenMessage {
    echo -e "\\033[32;1m${@}\033[0m"
}

function magentaMessage {
    echo -e "\\033[35;1m${@}\033[0m"
}

function cyanMessage {
    echo -e "\\033[36;1m${@}\033[0m"
}

function redMessage {
    echo -e "\\033[31;1m${@}\033[0m"
}

function yellowMessage {
	echo -e "\\033[33;1m${@}\033[0m"
}


clear
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
echo -e "Teamspeak Script"
echo -e "By Nexus "
echo -e "Viel Spass"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
sleep 6
clear
sleep 3

redMessage "=========================================="
redMessage "--------------------------------------- 0%"
redMessage "=========================================="
sleep 1

greenMessage "Erst werden die Programme Installiert "
sleep 6

apt-get update
apt-get install screen curl htop sudo
apt-get install nano
apt-get install mc
update-ca-certificates
clear
sleep 3

redMessage "=========================================="
redMessage "======-------------------------------- 10%"
redMessage "=========================================="
sleep 1

greenMessage "Teamspeak User Wird Erstellt"
sleep 6

adduser teamspeak
clear
sleep 3

redMessage "=========================================="
redMessage "=============------------------------- 25%"
redMessage "=========================================="
sleep 1

greenMessage "Installiere Teamspeak "
sleep 6

cd /home/teamspeak
wget http://dl.4players.de/ts/releases/3.0.13.6/teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2
tar xvfj teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2
rm teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2
clear
sleep 3
greenMessage "Teamspeak Start Script Wird Installiert"
sleep 6

cd /home/teamspeak
wget https://raw.githubusercontent.com/RocketSun/Teamspeak/master/ts3.sh
clear
sleep 3

redMessage "=========================================="
redMessage "====================------------------ 50%"
redMessage "=========================================="
sleep 1

greenMessage "Bearbeite Teamspeak Dateien"
sleep 6

mv /home/teamspeak/teamspeak3-server_linux_amd64/* /home/teamspeak/
sleep 3
rm teamspeak/teamspeak3-server_linux_amd64
clear
sleep 3

redMessage "=========================================="
redMessage "===============================------- 75%"
redMessage "=========================================="
sleep 1

greenMessage "Setzte Rechte"
sleep 6

cd /home/
chmod 777 teamspeak
clear
sleep 3

redMessage "=========================================="
redMessage "===================================== 100%"
redMessage "=========================================="
sleep 1

greenMessage "Teamspeak wird gestartet bitte die query login daten aufschreiben danke !!!!!"
sleep 6

cd /home/teamspeak
su root -c "./ts3server_startscript.sh start"
