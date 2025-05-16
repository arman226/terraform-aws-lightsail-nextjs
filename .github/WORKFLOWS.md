# GITHUB ACTIONS WORKFLOW

## Secrets Github in Github

✅ `LIGHT_SAIL_IP`: Public IP of your instance (from Terraform Output)
✅ `SSH_PRIVATE_KEY`: Your SSH Private Key

`.github/workflows/deploy.yml`

```yaml
name: Deploy to Lightsail

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Install dependencies
        run: npm install

      - name: Build Next.js app
        run: npm run build

      - name: Deploy via SSH
        uses: appleboy/scp-action@v0.1.3
        with:
          host: ${{ secrets.LIGHTSAIL_IP }}
          username: ubuntu
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          source: "."
          target: "/home/ubuntu/app"

      - name: Restart app via SSH
        uses: appleboy/ssh-action@v1.0.0
        with:
          host: ${{ secrets.LIGHTSAIL_IP }}
          username: ubuntu
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          script: |
            cd /home/ubuntu/app
            npm install
            pm2 restart all || npm run start &
```
