#!/bin/bash
#
#

su - vagrant

#Step 1: Java 11 installation
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
echo "Java installed"
sleep 1

#Step 2: Download SonarQube latest versions on your server
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
echo "sonarqube dowloaded"
sleep 1

#Step 3: Extract packages
sudo yum install -y unzip
sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo "unzip is installed"
sleep 1

#Step 4: Change ownership to the user and Switch to Linux binaries directory to start service
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/
./sonar.sh start
 echo "Ownership cange to vagrant"
 sleep 1

 #Connect to SonaQube
sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
echo "Connected to SonarQube"