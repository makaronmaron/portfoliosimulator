#!/bin/bash
# ポートフォリオシミュレーター GitHub Pages セットアップスクリプト
# 使い方: bash setup.sh

set -e

echo "=== Portfolio Simulator - GitHub セットアップ ==="
echo ""

# Check git
if ! command -v git &> /dev/null; then
  echo "エラー: git がインストールされていません"
  exit 1
fi

# Initialize git repo if not already
if [ ! -d ".git" ]; then
  git init
  echo "✓ git リポジトリを初期化しました"
fi

# Stage all files
git add index.html README.md .gitignore data/README.md

echo ""
echo "=== 次のステップ ==="
echo ""
echo "1. GitHub でリポジトリを作成:"
echo "   https://github.com/new"
echo ""
echo "2. 以下のコマンドを実行:"
echo "   git commit -m 'Initial commit'"
echo "   git remote add origin https://github.com/[ユーザー名]/[リポジトリ名].git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. data/ フォルダに CSV を追加:"
echo "   - data/topix.csv"
echo "   - data/sp500.csv"
echo "   - data/gold.csv"
echo "   - data/usdjpy.csv"
echo "   - data/jgb.csv (任意)"
echo ""
echo "4. CSV を追加したらプッシュ:"
echo "   git add data/"
echo "   git commit -m 'Add CSV data'"
echo "   git push"
echo ""
echo "5. GitHub Settings → Pages → Source: main / root → Save"
echo ""
echo "完了後、以下のURLでアクセスできます:"
echo "   https://[ユーザー名].github.io/[リポジトリ名]/"
