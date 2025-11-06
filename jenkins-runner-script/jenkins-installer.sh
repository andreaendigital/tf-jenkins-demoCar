#!/bin/bash
sudo yum update -y
sudo yum install -y java-17-amazon-corretto
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# jenkins-installer-amazon-linux.sh → para Amazon Linux 2023 (us-east-1 Free Tier)


# jenkins-installer-ubuntu.sh → para Ubuntu/Debian (si se usa otra AMI) :

#!/bin/bash
#sudo apt-get update
#yes | sudo apt install openjdk-11-jdk-headless
#echo "Waiting for 30 seconds before installing the jenkins package..."
#sleep 30
#sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
#  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
#echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#  /etc/apt/sources.list.d/jenkins.list > /dev/null
#sudo apt-get update
#yes | sudo apt-get install jenkins
#sleep 30
#echo "Waiting for 30 seconds before installing the Terraform..."
#wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_386.zip
#yes | sudo apt-get install unzip
#unzip 'terraform*.zip'
#sudo mv terraform /usr/local/bin/
