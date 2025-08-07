# Software_Install_Steps_For_Ubuntu


# Use this for Script file or User data
#!/bin/bash
set -e

# Update the System First

sudo apt update

sudo apt upgrade


# Docker Install

sudo apt install docker.io

sudo systemctl status docker.service

docker version


# Terraform Install

sudo apt update && sudo apt install -y software-properties-common gnupg curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt install -y terraform

terraform -version


# Install Java

sudo apt update

sudo apt upgrade -y

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


