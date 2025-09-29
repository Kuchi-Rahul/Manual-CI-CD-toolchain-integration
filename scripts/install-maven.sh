#!/bin/bash

set -e

sudo su - << 'EOF'

echo "Checking if Java is already present"
if ! command -v java > /dev/null 2>&1 ; then
    echo "Java is not installed. Installing OpenJDK now"
    
    echo "Updating system packages..."
    sudo apt upgrade -y
    sudo apt update -y
    
    sudo apt install unzip openjdk-21-jdk -y
fi

java -version
javac -version

echo "Switching to /opt directory"
cd /opt/ || { echo "ERROR IN CHANGING TO /opt DIRECTORY"; exit 1; }

echo "Downloading Maven"
wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.zip

echo "Extracting Maven"
unzip apache-maven-3.9.11-bin.zip
rm -f apache-maven-3.9.11-bin.zip

# Setting environment variables
cat << 'EOL' > /etc/profile.d/maven.sh
export M2_HOME=/opt/apache-maven-3.9.11
export PATH=$M2_HOME/bin:$PATH
EOL

EOF

echo "Reloading profile"
source /etc/profile.d/maven.sh

echo "Verifying Maven installation"
command -v mvn && mvn -version || echo "Maven not installed or PATH not set"

