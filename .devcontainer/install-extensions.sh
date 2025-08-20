#!/bin/bash

echo "🔌 Installing downloaded extensions..."

extensions_dir="/tmp/extensions"

if [ ! -d "$extensions_dir" ]; then
    echo "❌ No extensions directory found at $extensions_dir"
    exit 1
fi

if [ ! "$(ls -A $extensions_dir)" ]; then
    echo "ℹ️  No extensions to install"
    exit 0
fi

# Check if code command is available
if ! command -v code >/dev/null 2>&1; then
    echo "❌ Code command not available"
    exit 1
fi

# Install each extension
installed_count=0
for vsix_file in "$extensions_dir"/*.vsix; do
    if [ -f "$vsix_file" ]; then
        extension_name=$(basename "$vsix_file" .vsix)
        echo "Installing $extension_name..."
        
        if code --install-extension "$vsix_file"; then
            rm -f "$vsix_file"
            ((installed_count++))
            echo "✅ $extension_name installed successfully"
        else
            echo "❌ Failed to install $extension_name"
        fi
    fi
done

# Clean up empty directory
if [ $installed_count -gt 0 ]; then
    rmdir "$extensions_dir" 2>/dev/null || true
    echo ""
    echo "🎉 Successfully installed $installed_count extension(s)!"
else
    echo "❌ No extensions were installed"
fi 