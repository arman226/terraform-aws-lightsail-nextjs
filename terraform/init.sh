#!/bin/bash
apt update && apt upgrade -y
apt install -y git curl
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

# Clone the repository and go into the Next.js folder
git clone https://github.com/<your-username>/<your-repo>.git /home/ubuntu/app
cd /home/ubuntu/app/sample-integration

npm install
npm run build
npm run start &
