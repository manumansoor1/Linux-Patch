sudo dnf remove -y httpd
echo "🚀 Removing Nginx..."
sudo systemctl edisable httpd
sudo systemctl status httpd
