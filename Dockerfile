FROM node:22-bookworm

# Install system dependencies: Chrome, curl, git, and useful CLI tools
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    gnupg \
    ca-certificates \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y \
    google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Install OpenClaw globally
RUN npm install -g openclaw@latest

# Setup data directory
RUN mkdir -p /data

ENV OPENCLAW_STATE_DIR=/data
EXPOSE 3000

# Keep container alive for SSH access — run openclaw manually when ready
CMD ["sleep", "infinity"]
