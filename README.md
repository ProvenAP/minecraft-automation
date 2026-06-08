# Fully Automated Minecraft Server on AWS

## Background
This project automates the deployment of a Minecraft server on AWS using Terraform and Ansible. No manual AWS Console interaction is required.

## Requirements
- **AWS CLI** (v2)
- **Terraform** (>= 1.5)
- **Ansible** (>= 8.0)
- **nmap**
- **Git**
- A running AWS Academy Learner Lab session with active credentials.

## Setup

1. Clone this repository.
2. Run `source scripts/set_aws_credentials.sh` and enter your AWS Academy credentials.
3. Run `chmod +x deploy.sh && ./deploy.sh`.

## Verification
After deployment, run `nmap -sV -Pn -p T:25565 <instance-ip>` to confirm the Minecraft server is running.

## Resources
- [itzg/docker-minecraft-server](https://hub.docker.com/r/itzg/minecraft-server)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
