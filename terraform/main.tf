terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create a security group for the Minecraft server
resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft-sg"
  description = "Allow SSH and Minecraft traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "minecraft_server" {
  ami           = "ami-06aa3a7a6e961202a" # Ubuntu 24.04 LTS in us-east-1
  instance_type = "t2.medium"
  key_name      = "MyLinuxKey"            # Replace with your actual key pair name in AWS
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]

  tags = {
    Name = "Minecraft-Automated"
  }
}

# Output the public IP address of the instance
output "instance_public_ip" {
  value = aws_instance.minecraft_server.public_ip
}
