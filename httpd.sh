sudo dnf install -y httpd
echo "🚀 Starting Nginx..."
sudo systemctl enable httpd
sudo systemctl start httpd
