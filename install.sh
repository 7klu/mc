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

loginfo "Starting Minecraft Server installation..."

if [[ $EUID -ne 0 ]]; then
    logerror "This script must be run as root (with sudo)."
    exit 1
fi

loginfo "Updating and installing necessary dependencies..."
sudo apt update -y
sudo apt install openjdk-17-jdk wget curl -y || { logerror "Failed to install dependencies"; exit 1; }

loginfo "Creating directory structure for Minecraft server..."
mkdir -p ~/luMC
cd ~/luMC || { logerror "Failed to change directory to ~/luMC"; exit 1; }

loginfo "Downloading BuildTools for Spigot..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -O BuildTools.jar || { logerror "Failed to download BuildTools"; exit 1; }

loginfo "Compiling Spigot server..."
java -jar BuildTools.jar --rev 1.21 || { logerror "Failed to compile Spigot server"; exit 1; }

loginfo "Creating eula.txt and accepting the EULA..."
echo "eula=true" > eula.txt || { logerror "Failed to create eula.txt"; exit 1; }

loginfo "Creating and making the start script executable..."
echo -e "#!/bin/bash\n\njava -Xmx6G -Xms6G -jar spigot-1.21.jar nogui" > start.sh || { logerror "Failed to create start.sh"; exit 1; }
chmod +x start.sh || { logerror "Failed to make start.sh executable"; exit 1; }

logsuccess "Minecraft server setup completed successfully!"
loginfo "You can now start the server using ./start.sh"

loginfo "Setting correct permissions for server files..."
chmod -R 755 ~/luMC || { logerror "Failed to set correct permissions for server files"; exit 1; }
logsuccess "Permissions set successfully."

loginfo "Finished! To start the server, run './start.sh' in the ~/luMC directory."
loginfo "Check your Java version with: java -version"
