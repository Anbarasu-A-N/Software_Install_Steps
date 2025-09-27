# Software_Install_Steps_For_Ubuntu


# Use this for Script file or User data
#!/bin/bash 
set -e
# Update the System First
sudo apt update -y
sudo apt upgrade -y

echo ""
echo "==================================================================================="
echo ""


# Docker Install
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

echo ""
echo "==================================================================================="
echo ""


# Install Java
sudo apt install openjdk-17-jdk -y

echo ""
echo "==================================================================================="
echo ""


# Install maven
sudo apt install maven -y


echo ""
echo "==================================================================================="
echo ""


# Run the java application in background
nohup java -jar /home/ubuntu/app.jar > app.log 2>&1 &

# Find the port and kill

sudo ss -tulnp | grep 8082
kill -9 <pid>


echo ""
echo "==================================================================================="
echo ""


# Install Jenkins
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
sudo bash -c 'cat > /etc/sudoers.d/jenkins <<EOF
jenkins ALL=(ALL) NOPASSWD:ALL
Defaults:jenkins !requiretty
EOF'
sudo systemctl start jenkins
sudo systemctl enable jenkins


echo ""
echo "==================================================================================="
echo ""


# Terraform Install
sudo apt update && sudo apt install -y software-properties-common gnupg curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt install -y terraform
terraform -version

echo ""
echo "==================================================================================="
echo ""

# Install Apache
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
sudo chown -R ubuntu:ubuntu /var/www/html/


echo ""
echo "==================================================================================="
echo ""


# Install Node
sudo apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
node --version
npm --version


echo ""
echo "==================================================================================="
echo ""


# Using Apache2 and Node to deploy the website from Git
git clone https://github.com/Anbarasu-A-N/Anbarasu_Portfolio.git

cd Anbarasu_Portfolio
## Update all packages to the latest allowed by package.json
sudo npm update

rm -r * /var/www/html/

sudo npm install

npm run build

sudo cp -r dist/* /var/www/html/

echo ""
echo "==================================================================================="
echo ""



