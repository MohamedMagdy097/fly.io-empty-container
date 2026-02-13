FROM node:22-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN npm install -g openclaw@latest
RUN mkdir -p /data

ENV OPENCLAW_STATE_DIR=/data
EXPOSE 3000

CMD ["openclaw", "gateway", "--allow-unconfigured", "--port", "3000", "--bind", "lan"]