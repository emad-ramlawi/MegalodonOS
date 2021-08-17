#!/bin/bash
IP="$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"

sleep 2

if [ ! -f "/home/arch/.mega" ]; then
   echo -e "\033[32m Initializing...\n to skip this create ~/.mega \033[0m"   
   sleep 1
   echo -e "\033[32m Upgrading all pkgs \033[0m"
   sudo pacman -Syu --noconfirm
   sleep 1
   echo -e "\033[32m Install usefull pkgs \033[0m"
   sudo pacman -S htop nano jq k9s ncdu vi containerd --noconfirm
   sudo systemctl enable containerd.service && sudo systemctl start containerd.service
   sleep 1
   echo -e "\033[32m Installing latest kubeadm kubelet kubectl \033[0m"
   yes | sudo pacman -S kubeadm kubelet kubectl
   sudo systemctl enable kubelet.service && sudo systemctl start kubelet.service
   sleep 1
   echo -e "\033[32m Applying sysctl \033[0m"
   sudo sysctl --system  > /dev/null 2>&1
   sleep 1
   echo -e "\033[32m Pulling latest k8s images \033[0m"
   sleep 1
   sudo kubeadm config images pull
   sudo modprobe overlay
   sudo modprobe br_netfilter
   sleep 1
   echo -e "\033[33m Ur Done! please run\n sudo kubeadm init --pod-network-cidr=$IP/24 \033[0m"
   touch ~/.mega
fi
