# Software_Install_Steps_For_Ubuntu


# Use this for Script file or User data
#!/bin/bash 

set -e

# Update the System First

sudo apt update -y

sudo apt upgrade -y


# Docker Install

sudo apt install docker.io -y

sudo systemctl start docker

sudo systemctl enable docker

docker version


# Terraform Install

sudo apt update && sudo apt install -y software-properties-common gnupg curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt install -y terraform

terraform -version

# Install Apache
sudo apt install -y apache2

sudo systemctl enable apache2

sudo systemctl start apache2

sudo systemctl status apache2

sudo chown -R ubuntu:ubuntu /var/www/html/


# Install Node

sudo apt install -y curl

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

sudo apt install -y nodejs

sudo npm update

sudo npm install

npm run dev

# Using Apache2 and Node to deploy the website from Git
git clone https://github.com/Anbarasu-A-N/Anbarasu_Portfolio.git

cd Anbarasu_Portfolio
## Update all packages to the latest allowed by package.json
npm update

rm -r * /var/www/html/

sudo npm install

npm run build

sudo cp -r dist/* /var/www/html/


# Install Java

sudo apt install openjdk-17-jdk -y


# Install Jenkins

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins -y

sudo systemctl start jenkins

sudo systemctl enable jenkins


