# TERRAFORM CONFIGURATIONS

## Requirements

✅ AWS ACCOUNT and access keys
✅ Terraform (CLI) installed

## Terraform Files

`main.tf`

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_lightsail_instance" "nextjs_app" {
  name              = "nextjs-app"
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "micro_2_0"
  key_pair_name     = var.key_pair_name

  user_data = file("init.sh")
}

output "instance_ip" {
  value = aws_lightsail_instance.nextjs_app.public_ip_address
}
```

`variables.tf`

```hcl
variable "key_pair_name" {
  description = "Name of the Lightsail SSH key pair"
  type        = string
}
```

`init.sh`

_This script will run on your instance at first boot. It installs Node.js, clones the repo, installs dependencies, and starts the app._

```sh
#!/bin/bash
apt update && apt upgrade -y
apt install -y git curl
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

# Clone your repo
git clone https://github.com/<your-username>/<your-repo>.git /home/ubuntu/app
cd /home/ubuntu/app

npm install
npm run build
npm run start &
```

## Commands to deploye

```bash
terraform init
terraform apply -var="key_pair_name=your-ssh-key-name"
```
