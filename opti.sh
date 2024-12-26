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

loginfo "Starting Linux Optimizer setup..."

loginfo "Cloning Linux Optimizer repository..."
git clone https://github.com/hawshemi/Linux-Optimizer || { logerror "Failed to clone repository"; exit 1; }

cd Linux-Optimizer || { logerror "Failed to change directory to Linux-Optimizer"; exit 1; }

loginfo "Making Linux Optimizer script executable..."
chmod +x linux-optimizer.sh || { logerror "Failed to make linux-optimizer.sh executable"; exit 1; }

logsuccess "Linux Optimizer setup completed successfully!"
loginfo "To run the script, use 'sudo ./linux-optimizer.sh'."

loginfo "Finished! To run the optimizer, execute './linux-optimizer.sh' with 'sudo'."
logwarning "Remember to run the script as root using 'sudo ./linux-optimizer.sh'."
