
# Fully Automated Minecraft Server on AWS

## Background
This project provisions an EC2 instance using Terraform, then it configures it using Ansible to run a Minecraft server inside a Docker container. The entire process is automated – no manual AWS Console clicks or SSH into the server.

## Architecture Diagram
```mermaid
graph TD
    A[User] --> B[Set AWS credentials]
    B --> C[Run deploy.sh]
    C --> D[Terraform: Provision EC2 + SG]
    D --> E[Ansible: Install Docker]
    E --> F[Run Minecraft container]
    F --> G[nmap shows port open]

## Requirements

Operating System: Linux, macOS, or Windows WSL

Tools:

	1. terraform >= 1.5

	2. ansible >= 8.0

	3. git

	4. nmap

AWS Academy Learner Lab with active session

Credentials: Copy AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN from the "AWS Details" tab

## Setup/commands

1. Clone this repository.

	`git clone https://github.com/ProvenAP/minecraft-automation.git`
	`cd minecraft-automation`

2. Run `source scripts/set_aws_credentials.sh` and enter your AWS Academy credentials.
3. Run `chmod +x deploy.sh && ./deploy.sh`.

In summary it is initializing Terraform and creates the EC2 Instance as well as the security group with it.
It will save the instance's public IP and execute the Ansible playbook to install Docker and start the minecraft container.

## Verification
After deployment, run 
(replace <instance-ip> with the IP shown in the output):
`nmap -sV -Pn -p T:25565 <instance-ip>` to confirm the Minecraft server is running.

You should get something like:

PORT      STATE SERVICE   VERSION
25565/tcp open  minecraft Minecraft 26.1.2

## Resources
- [itzg/docker-minecraft-server](https://hub.docker.com/r/itzg/minecraft-server)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
