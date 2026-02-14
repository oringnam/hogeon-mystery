#!/bin/bash

# Ink 스토리 컴파일 스크립트

GAME=$1

if [ -z "$GAME" ]; then
    echo "❌ Usage: ./scripts/compile.sh <game-name>"
    echo "Example: ./scripts/compile.sh hogeon"
    exit 1
fi

GAME_DIR="games/$GAME"
INK_FILE="$GAME_DIR/story.ink"
JSON_FILE="$GAME_DIR/story.json"
INKLECATE="./tools/inklecate"

# inklecate 확인
if [ ! -f "$INKLECATE" ]; then
    echo "❌ inklecate not found!"
    echo "Run: ./scripts/setup-inklecate.sh"
    exit 1
fi

# .ink 파일 확인
if [ ! -f "$INK_FILE" ]; then
    echo "❌ $INK_FILE not found!"
    exit 1
fi

echo "🔨 Compiling $INK_FILE..."

# 컴파일
$INKLECATE -o "$JSON_FILE" "$INK_FILE"

if [ $? -eq 0 ]; then
    echo "✅ Compiled successfully!"
    echo "📄 Output: $JSON_FILE"
else
    echo "❌ Compilation failed!"
    exit 1
fi
