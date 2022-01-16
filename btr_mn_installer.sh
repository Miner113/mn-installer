#!/bin/bash
# Author Alexander Khudyakov(Miner113)
# Copyright (c) 2021-2021 The GRMScoin developers

declare -r BLUE="\033[0;34m"
declare -r RED='\033[0;31m'
declare -r GREEN='\033[0;32m'
declare -r NC='\033[0m'

function start_setup() {
  echo -e ""
  echo -e " ${GREEN}Author Alexander Khudyakov(Miner113) ${NC}"
  echo -e ""
  echo -e "  г===¬ г===¬ г=¬г=¬ г===¬ г===¬ г===¬ г==¬ г=¬-г¬ "
  echo -e "  ¦г=¬¦ ¦г=¬¦ ¦¦L-¦¦ ¦г=¬¦ ¦г=¬¦ ¦г=¬¦ L¦-- ¦¦L¬¦¦ "
  echo -e "  ¦¦-L- ¦L=-¦ ¦г¬г¬¦ ¦L==¬ ¦¦-L- ¦¦-¦¦ -¦¦- ¦г¬L-¦ "
  echo -e "  ¦¦г=¬ ¦г¬г- ¦¦¦¦¦¦ L==¬¦ ¦¦-г¬ ¦¦-¦¦ -¦¦- ¦¦L¬¦¦ "
  echo -e "  ¦L¦=¦ ¦¦¦L¬ ¦¦¦¦¦¦ ¦L=-¦ ¦L=-¦ ¦L=-¦ г¦-¬ ¦¦-¦¦¦ "
  echo -e "  L===- L-L=- L-L-L- L===- L===- L===- L==- L--L=- "
  echo -e ""
  echo -e ""
  echo -e "${BLUE}Welcome to the GRMScoin installation${NC}"
  echo -e ""
  echo -e "${RED}Do you want to install GRMScoin ?${NC}"
  echo -e ""
}

function install_packages() {
  echo -e "* Package installation"
  apt-get -y -o=Dpkg::Use-Pty=0 -o=Acquire::ForceIPv4=true install dirmngr wget software-properties-common ufw
  cd
  wget https://grms.pw/grmscoinds.tar.gz
  tar -xvf grmscoinds.tar.gz
  cp /root/grmscoinds/install/grmscoind.service /etc/systemd/system
  cd /root/grmscoinds
  ./fetch-params.sh
  echo -e "${GREEN}Installation fetch-params!${NC}"
  sudo ufw allow 21686
  sudo ufw allow 21686
  systemctl daemon-reload
  systemctl start grmscoind
  echo -e "${GREEN}Installation grmscoind!${NC}"
  systemctl enable grmscoind

}

function display_information() {
 echo
 echo -e "================================================================================================================================"
 echo -e "${GREEN}Installation completed!${NC}"
 echo -e "${GREEN}Website${NC}: https://grms.pw"
 echo -e "${GREEN}GRMScoind Docs${NC}: https://docs.grms.pw"
 echo -e "${GREEN}Explorer: https${NC}://explorer.grms.pw"
 echo -e "${GREEN}GRMS node start${NC}: ${RED}systemctl start grmscoind${NC}"
 echo -e "${GREEN}GRMS node restart${NC}: ${RED}systemctl restart grmscoind${NC}"
 echo -e "${GREEN}GRMS node stop${NC}: ${RED}systemctl stop grmscoind${NC}"
 echo -e "${GREEN}Please check ${GREEN}GRMScoin${NC} is running with the following command: ${GREEN}systemctl status grmscoind${NC}"
 echo -e "================================================================================================================================"
}

start_setup
install_packages
display_information
