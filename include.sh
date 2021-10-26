#!/usr/bin/env bash
################################################################################
# ansible-client-provisioning variables and functions for external include usage.
#
# Copyright: (C) 2021 TechDivision GmbH - All Rights Reserved
# Author: Rene Terfoorth
################################################################################

function install_mac_m1() {
     echo "checking xcode..." 
        xcode-select --install && 
        printf "\e[32m___________________________________________________________________\e[m\n"    
        read -p "Press [Enter] key !!AFTER!! X-CODE installation is finished..."
        printf "\e[32m___________________________________________________________________\e[m\n" 
         if ! command -v brew &> /dev/null
          then 
              cd /opt &&
              chmod 775 /opt
              sudo mkdir homebrew 
              sudo chown "$USER" homebrew 
              sudo chgrp admin homebrew 
              curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
              export PATH="/opt/homebrew/bin:$PATH"
            fi
        brew install ansible
}

function install_mac_intel() {

    #install xcode, brew a. ansible
    echo "checking xcode..." 
        xcode-select --install  
        printf "\e[32m___________________________________________________________________\e[m\n" 
        read -p "Press [Enter] key !!AFTER!! X-CODE installation is finished..."
        printf "\e[32m___________________________________________________________________\e[m\n"   
        if ! command -v brew &> /dev/null
            then 
            yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
        fi
        brew install ansible    
}