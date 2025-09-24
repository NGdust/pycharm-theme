#!/bin/bash

# Скрипт для установки PyCharm Dark Theme в Cursor

echo "🎨 Установка PyCharm Dark Theme в Cursor..."

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
    echo "❌ Неподдерживаемая операционная система: $OSTYPE"
    exit 1
fi

# Создаём директорию расширений если её нет
mkdir -p "$CURSOR_EXTENSIONS_DIR"

# Копируем тему
THEME_DIR="$CURSOR_EXTENSIONS_DIR/pycharm-theme"
echo "📁 Копирование темы в $THEME_DIR..."

if [ -d "$THEME_DIR" ]; then
    echo "⚠️  Тема уже установлена. Удаляем старую версию..."
    rm -rf "$THEME_DIR"
fi

# Получаем путь к текущей директории
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -r "$SCRIPT_DIR" "$THEME_DIR"

echo "✅ Тема успешно установлена!"
echo ""
echo "📋 Следующие шаги:"
echo "1. Перезапустите Cursor"
echo "2. Нажмите Cmd+Shift+P (или Ctrl+Shift+P)"
echo "3. Введите 'Preferences: Color Theme'"
echo "4. Выберите 'PyCharm Dark Theme'"
echo ""
echo "🎉 Наслаждайтесь новой темой!"
