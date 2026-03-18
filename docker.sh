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

echo "🐳 Installing Docker..."

if [[ "$OS" == "amzn" || "$OS" == "rhel" || "$OS" == "centos" ]]; then
    
    if command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y docker
    else
        sudo yum install -y docker
    fi

elif [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then

    sudo apt update -y
    sudo apt install -y docker.io

else
    echo "❌ Unsupported OS"
    exit 1
fi

echo "🚀 Starting Docker..."

sudo systemctl enable docker
sudo systemctl start docker

echo "👤 Adding user to docker group..."
sudo usermod -aG docker ec2-user

echo "✅ Docker Installed Successfully!"

docker --version
