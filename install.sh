#!/bin/bash

# Script to install PyCharm Professional Dark in Cursor

echo "🎨 Installing PyCharm Professional Dark in Cursor..."

# Определяем операционную систему
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    CURSOR_EXTENSIONS_DIR="$HOME/.cursor/extensions"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    CURSOR_EXTENSIONS_DIR="$HOME/.cursor/extensions"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows (Git Bash)
    CURSOR_EXTENSIONS_DIR="$USERPROFILE/.cursor/extensions"
else
    echo "❌ Unsupported operating system: $OSTYPE"
    exit 1
fi

# Create extensions directory if it doesn't exist
mkdir -p "$CURSOR_EXTENSIONS_DIR"

# Copy theme
THEME_DIR="$CURSOR_EXTENSIONS_DIR/pycharm-theme"
echo "📁 Copying theme to $THEME_DIR..."

if [ -d "$THEME_DIR" ]; then
    echo "⚠️  Theme already installed. Removing old version..."
    rm -rf "$THEME_DIR"
fi

# Get current directory path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -r "$SCRIPT_DIR" "$THEME_DIR"

echo "✅ Theme successfully installed!"
echo ""
echo "📋 Next steps:"
echo "1. Restart Cursor"
echo "2. Press Cmd+Shift+P (or Ctrl+Shift+P)"
echo "3. Type 'Preferences: Color Theme'"
echo "4. Select 'PyCharm Professional Dark'"
echo ""
echo "🎉 Enjoy your new theme!"
