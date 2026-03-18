#!/bin/bash

echo "Starting patching..."

sudo dnf clean all
sudo dnf update -y

echo "Patching completed successfully!"
