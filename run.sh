#!/bin/bash

RESET='\033[0m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RED='\033[0;31m'

loginfo() {
    echo -e "${CYAN}[INFO] $1${RESET}"
}

logsuccess() {
    echo -e "${GREEN}[SUCCESS] $1${RESET}"
}

logwarning() {
    echo -e "${YELLOW}[WARNING] $1${RESET}"
}

logerror() {
    echo -e "${RED}[ERROR] $1${RESET}"
}

echo -e "${CYAN}
o                     __...__     *               
              *   .--'    __.=-.             o
     |          ./     .-'     
    -O-        /      /   
     |        /    '\"/               *
             |     (@)     
            |        \                         
            |         \ *          |   
             |  .   /  `                 -O-
              \  \`~~\                     |
         o     \     \            *         
                `\    `-.__           .  
    .             `--._    `--'   
                       `---~~`                *
            *                   o
${RESET}"

loginfo "Starting setup..."

loginfo "Making install.sh executable..."
chmod +x install.sh || { logerror "Failed to make install.sh executable"; exit 1; }

loginfo "Making opti.sh executable..."
chmod +x opti.sh || { logerror "Failed to make opti.sh executable"; exit 1; }

logsuccess "Setup completed successfully!"
loginfo "To run the scripts, use 'sudo ./install.sh' and 'sudo ./opti.sh'."

loginfo "Finished! Remember to run both scripts with 'sudo'."
logwarning "Run them as root using 'sudo ./install.sh' and 'sudo ./opti.sh'."
