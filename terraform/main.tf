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
# 🔓 Open port 22 for SSH and 3000 for public access
resource "aws_lightsail_instance_public_ports" "nextjs_app_ssh" {
  instance_name = aws_lightsail_instance.nextjs_app.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  port_info {
    protocol  = "tcp"
    from_port = 3000
    to_port   = 3000
  }
}


output "instance_ip" {
  value = aws_lightsail_instance.nextjs_app.public_ip_address
}
