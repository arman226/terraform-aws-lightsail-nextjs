provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_lightsail_instance" "nextjs_app" {
  name              = "nextjs-app"
  availability_zone = "ap-southeast-1a"
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "micro_2_0"
  key_pair_name     = var.key_pair_name
  user_data         = file("init.sh")
}

output "instance_ip" {
  value = aws_lightsail_instance.nextjs_app.public_ip_address
}
