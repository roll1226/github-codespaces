#!/bin/bash

# GitHub Codespaces用初期セットアップスクリプト（Docker in Docker）

echo "🚀 Starting Docker in Docker development environment setup..."

# 作業ディレクトリに移動
cd /workspaces/github-codespaces

# .envファイルの作成（存在しない場合）
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cp example.env .env

    # GitHub Codespaces用のデフォルト値に置換
    sed -i 's|DATABASE_URL=.*|DATABASE_URL=postgresql://postgres:password@db:5432/imgix_app|g' .env
    sed -i 's|NEXT_PUBLIC_APP_URL=.*|NEXT_PUBLIC_APP_URL=http://localhost:3000|g' .env
    sed -i 's|IMGIX_URL=.*|IMGIX_URL=demo.imgix.net|g' .env

    # PostgreSQL環境変数を追加
    echo "" >> .env
    echo "# PostgreSQL Settings" >> .env
    echo "POSTGRES_USER=postgres" >> .env
    echo "POSTGRES_PASSWORD=password" >> .env
    echo "POSTGRES_DB=imgix_app" >> .env

    echo "✅ .env file created with default values"
else
    echo "ℹ️ .env file already exists"
fi

# Node.js依存関係のインストール
echo "📦 Installing Node.js dependencies..."
npm ci

# Dockerが利用可能になるまで待機
echo "⏳ Waiting for Docker to be available..."
until docker info > /dev/null 2>&1; do
    echo "Waiting for Docker daemon..."
    sleep 2
done

echo "🌐 Available services:"
echo "  - Main App: http://localhost:3000"
echo "  - Drizzle Studio: http://localhost:4983"
echo "  - PostgreSQL: localhost:5432"
echo ""
echo "Happy coding! 🚀"
