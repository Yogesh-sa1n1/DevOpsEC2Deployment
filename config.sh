#!/bin/bash

set -e

DISTRO=$(cat /etc/os-release | grep ^ID= | cut -d= -f2 | tr -d '"')

if [[ "$DISTRO" == "amzn" || "$DISTRO" == "centos" || "$DISTRO" == "rhel" ]]; then
      sudo yum update -y
      sudo yum install wget coreutils git -y
      sudo wget https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.rpm
      sudo rpm -ivh jdk-24_linux-x64_bin.rpm || true
      echo "export JAVA_HOME=/usr/java/latest" >> /etc/profile
      echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile
      export JAVA_HOME=/usr/java/latest
      cd /home/ec2-user
      sudo chown -R ec2-user:ec2-user /home/ec2-user
      export HOME=/home/ec2-user
      sleep 10
      sudo -u ec2-user git clone https://github.com/techeazy-consulting/techeazy-devops /home/ec2-user/app
      sudo chown -R ec2-user:ec2-user /home/ec2-user/app
      cd /home/ec2-user/app
    elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
      sudo apt-get update -y
      sudo apt-get install wget coreutils git -y
      sudo wget https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.deb
      sudo dpkg -i jdk-24_linux-x64_bin.deb
      echo 'export JAVA_HOME=/usr/lib/jvm/jdk-24.0.1-oracle-x64' >> ~/.bashrc
      echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
      source ~/.bashrc
      echo 'export JAVA_HOME=/usr/lib/jvm/jdk-24.0.1-oracle-x64' | sudo tee -a /etc/profile
      echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile
      source /etc/profile
      export JAVA_HOME=/usr/lib/jvm/jdk-24.0.1-oracle-x64
      export PATH=$JAVA_HOME/bin:$PATH
      touch one.html
      cd /home/ubuntu
      touch two.html
      sudo chown -R ubuntu:ubuntu /home/ubuntu
      touch three.html
      export HOME=/home/ubuntu
      touch four.html
      sleep 10
      sudo -u ubuntu git clone https://github.com/techeazy-consulting/techeazy-devops /home/ubuntu/app
      touch five.html
      sudo chown -R ubuntu:ubuntu /home/ubuntu/app
      cd /home/ubuntu/app
    fi
    
 chmod +x mvnw
 touch six.html
 nohup ./mvnw spring-boot:run -Dspring-boot.run.arguments="--server.port=8080" > app.log 2>&1 &
 
SHUTDOWN_MINUTES=${shutdown_delay_minutes}
echo "The instance will shut down in $SHUTDOWN_MINUTES minutes to save costs..."
sudo shutdown -h +$SHUTDOWN_MINUTES
