#!/bin/bash

# Exit on error
set -e

echo "🔍 Detecting OS..."

if [ -f /etc/debian_version ]; then
    echo "📦 Debian/Ubuntu detected"
    
    sudo apt update -y
    sudo apt install -y nginx

elif [ -f /etc/redhat-release ]; then
    echo "📦 RHEL/CentOS/Amazon Linux detected"
    
    sudo yum install -y epel-release || true
    sudo yum install -y nginx

else
    echo "❌ Unsupported OS"
    exit 1
fi

echo "🚀 Starting Nginx..."

sudo systemctl start nginx
sudo systemctl enable nginx

echo "🔥 Configuring Firewall..."

# Allow HTTP traffic
if command -v ufw >/dev/null 2>&1; then
    sudo ufw allow 'Nginx HTTP'
    sudo ufw reload
elif command -v firewall-cmd >/dev/null 2>&1; then
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --reload
fi

echo "✅ Nginx Installed and Running!"

# Show status
sudo systemctl status nginx --no-pager
