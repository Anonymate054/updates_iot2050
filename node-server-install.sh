#!/bin/bash

# Update and install packages
echo "Updating packages..."
apt-get update > /dev/null
echo "Update executed."
apt-get upgrade -y > /dev/null
echo "Upgrade executed."
apt-get install htop git nano usbutils nmap traceroute telnet man less docker docker-compose -y > /dev/null
echo "Essential packages installed. - Completed"


# Download and install nvm
echo "Downloading and installing nvm..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash > /dev/null
source ~/.bashrc
echo "Download and install nvm - Completed"

# Install Node.js v18 and set it as default
echo "Installing Node.js v18 and setting it as default..."
nvm install v18
nvm alias default v18
echo "Install Node.js v18 and set it as default - Completed"

# Remove existing symbolic links and create new ones
echo "Removing existing symbolic links and creating new ones..."
rm -f /usr/bin/node
rm -f /usr/bin/npm
ln -s $(which node) /usr/bin/
ln -s $(which npm) /usr/bin/
echo "Remove existing symbolic links and create new ones - Completed"

# Show npm and Node.js versions
echo "npm version:"
npm -v
echo "Node.js version:"
node -v

# Update npm to the latest version
npm install -g npm@latest > /dev/null

# Install node-red-admin and node-red globally
echo "Installing node-red-admin and node-red globally..."
npm install -g node-red-admin > /dev/null
npm install -g --unsafe-perm node-red > /dev/null

# Install essential packages for Node-RED
echo "Installing essential packages for Node-RED..."
npm install node-red-contrib-s7 > /dev/null
npm install node-red-contrib-opcua > /dev/null
npm install node-red-contrib-cip-ethernet-ip > /dev/null
npm install node-red-contrib-pccc > /dev/null
npm i node-red-node-mysql > /dev/null
npm install node-red-contrib-influxdb > /dev/null
npm install node-red-contrib-mssql > /dev/null
npm install node-red-node-sqlite > /dev/null
npm install node-red-dashboard > /dev/null
npm install node-red-node-ui-table > /dev/null
echo "Installation of essential packages for Node-RED - Completed"

# Fix security vulnerabilities
echo "Fixing security issues..."
npm audit fix --force > /dev/null
echo "Security issues fixed - Completed"

# Get the path of the node-red executable
node_red_executable=$(which node-red)

# Content of the node-red.service file
service_content="[Unit]
Description=Node-RED
After=syslog.target network.target

[Service]
Type=idle
Restart=on-failure
ExecStart=$node_red_executable -u /root/.node-red
[Install]
WantedBy=multi-user.target"

# Full path of the service file
service_file_path="/lib/systemd/system/node-red.service"

# Save the content to the file
echo "$service_content" > "$service_file_path"

# Enable the service
systemctl enable node-red
systemctl start node-red

echo "Node-RED installed and enabled as a service."
