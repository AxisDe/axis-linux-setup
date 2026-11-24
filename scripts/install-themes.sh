#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ICONS_DIR="$HOME/.local/share/icons"
COLORS_DIR="$HOME/.local/share/color-schemes"

mkdir -p "$ICONS_DIR" "$COLORS_DIR"

echo "Installing Kora icons..."

if [[ ! -d "$ICONS_DIR/kora" ]]; then
    TEMP_DIR="$(mktemp -d)"
    trap 'rm -rf "$TEMP_DIR"' EXIT
    git clone --depth=1 https://github.com/bikass/kora.git "$TEMP_DIR/kora"
    cp -a "$TEMP_DIR/kora/kora" "$ICONS_DIR/"
else
    echo "Kora already exists; leaving it untouched."
fi

echo "Installing ZZZ color scheme..."
install -m 644 "$REPO_DIR/assets/color-schemes/ZZZ.colors" "$COLORS_DIR/ZZZ.colors"

echo "Kora and ZZZ installation complete."
echo "Select them in KDE System Settings."
