#!/bin/bash

# GitHub Codespaces用初期セットアップスクリプト（Docker in Docker）

echo "🚀 Starting Docker in Docker development environment setup..."

# 作業ディレクトリに移動
cd /workspaces/github-codespaces

# Node.js依存関係のインストール
echo "📦 Installing Node.js dependencies..."
npm ci

# Dockerが利用可能になるまで待機
echo "⏳ Waiting for Docker to be available..."
until docker info > /dev/null 2>&1; do
    echo "Waiting for Docker daemon..."
    sleep 2
done

# 環境構築が完了した旨のメッセージを表示したい
echo "🎉 Development environment setup complete"
echo "Happy coding! 🚀"
