#!/bin/bash

echo "START PATCH"
sudo dnf update -y

echo "Updating system..."
uname -r

echo "patch completed"
