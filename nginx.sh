#!/bin/bash
set -e

echo "🔍 Detecting OS..."

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "❌ Cannot detect OS"
    exit 1
fi

echo "Detected OS: $OS"

# ==============================
# INSTALL NGINX
# ==============================

if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    echo "📦 Debian/Ubuntu detected"

    sudo apt update -y
    sudo apt install -y nginx

elif [[ "$OS" == "amzn" || "$OS" == "centos" || "$OS" == "rhel" ]]; then
    echo "📦 Amazon Linux / RHEL detected"

    if command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y nginx
    else
        sudo yum install -y nginx
    fi

else
    echo "❌ Unsupported OS: $OS"
    exit 1
fi

# ==============================
# START NGINX
# ==============================

echo "🚀 Starting Nginx..."
sudo systemctl enable nginx
sudo systemctl start nginx

# ==============================
# FIREWALL CONFIG
# ==============================

echo "🔥 Configuring Firewall..."

if command -v ufw >/dev/null 2>&1; then
    sudo ufw allow 'Nginx HTTP'
    sudo ufw reload

elif command -v firewall-cmd >/dev/null 2>&1; then
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --reload

else
    echo "⚠️ No firewall tool detected (OK for EC2 Security Groups)"
fi

# ==============================
# STATUS
# ==============================

echo "✅ Nginx Installed and Running!"
sudo systemctl status nginx --no-pager
