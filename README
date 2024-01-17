## Node Server Installation Script for Simatic IOT 2050

### Overview

This script automates the installation of Node.js version 18 and npm version 0.39.1 on the Simatic IOT 2050 device by Siemens. The purpose is to enable the installation of Node-RED along with all the necessary dependencies for proper functionality and automatic restart on the Simatic IOT 2050. This is particularly useful when the default Node.js version on the device is outdated for certain blocks.

### Usage Instructions

Follow these steps to use the installation script:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Anonymate054/updates_iot2050.git
   cd updates_iot2050
    ```
2. Provide Execution Permissions:
   ```bash
   chmod +x node-server-install.sh
   ```
3. Execute the Script::
   ```bash
   ./node-server-install.sh
   ```

## Troubleshooting
If you encounter issues such as the error $'\r': command not found, it may be due to Windows-style line endings in the script. To resolve this, execute the following commands:

   ```bash
   sudo apt-get install dos2unix
   dos2unix node-server-install.sh
   ```

## Important Notes
* Ensure that you have internet connectivity during the execution of the script to download and install the required packages.
* This script assumes that Node.js version 18 and npm version 0.39.1 are compatible with the Simatic IOT 2050. Verify compatibility before running the script.
* After successful execution, Node-RED and its dependencies should be installed, allowing for improved functionality on the Simatic IOT 2050.


**Disclaimer:** Use this script at your own risk, and ensure that it is compatible with your specific Simatic IOT 2050 device. Always backup important data before making significant changes to your system.