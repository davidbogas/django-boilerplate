#!/bin/bash
set -e

echo "🚀 Starting devcontainer setup..."

# Update system and install required packages
echo "📦 Installing system packages..."
sudo apt-get update
sudo apt-get install -y postgresql-client libpq-dev python3-dev build-essential wget

# Install Python requirements
echo "🐍 Installing Python requirements..."
pip install -r requirements/dev.txt

# Function to download extension from Microsoft Marketplace
download_extension() {
    local publisher=$1
    local extension=$2
    
    echo "📥 Downloading ${publisher}.${extension}..."
    
    # Create extensions directory
    mkdir -p /tmp/extensions
    
    # Download extension
    wget -q -O "/tmp/${publisher}.${extension}.vsix" "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${publisher}/vsextensions/${extension}/latest/vspackage"
    
    # Decompress (Microsoft marketplace returns gzipped files)
    gunzip -c "/tmp/${publisher}.${extension}.vsix" > "/tmp/extensions/${extension}.vsix"
    
    # Remove compressed version
    rm -f "/tmp/${publisher}.${extension}.vsix"
    
    echo "✅ ${publisher}.${extension} downloaded"
}

# Download extensions from Microsoft Marketplace
if command -v code >/dev/null 2>&1; then
    echo "🔌 Downloading extensions from Microsoft Marketplace..."
    download_extension "batisteo" "vscode-django"
    download_extension "shamanu4" "django-intellisense"
fi

echo ""
echo "🎉 Devcontainer setup completed successfully!"

# Show installation instructions only if extensions were downloaded
if [ -d "/tmp/extensions" ] && [ "$(ls -A /tmp/extensions)" ]; then
    echo ""
    echo "🔌 MANUAL EXTENSION INSTALLATION REQUIRED:"
    echo "   Some extensions were not available in the marketplace, so they were downloaded and you need to install them manually."
    echo "   Run: bash .devcontainer/install-extensions.sh"
fi