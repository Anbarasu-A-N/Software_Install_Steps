#!/bin/bash
# Step 1: Update package index (VERY IMPORTANT)
sudo apt update

sudo apt upgrade -y

# Step 2: Install nginx
sudo apt install nginx -y

# Start service
sudo systemctl start nginx

# Enable auto-start on boot
sudo systemctl enable nginx

# Check status
sudo systemctl status nginx
