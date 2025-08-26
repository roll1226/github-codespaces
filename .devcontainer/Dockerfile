FROM mcr.microsoft.com/devcontainers/typescript-node:20

# Install PostgreSQL client for development
RUN apt-get update \
    && apt-get install -y postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspaces/github-codespaces
