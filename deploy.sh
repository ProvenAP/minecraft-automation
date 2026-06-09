#!/bin/bash

# This script fully automates the Minecraft server deployment.

# 1. Configure AWS Credentials
echo "Configuring AWS credentials..."
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "AWS credentials not found. Please run 'source scripts/set_aws_credentials.sh' first."
    exit 1
fi

# 2. Terraform Provisioning
echo "Provisioning infrastructure with Terraform..."
cd terraform
terraform init
terraform apply -auto-approve
INSTANCE_IP=$(terraform output -raw instance_public_ip)
echo "Instance is at: $INSTANCE_IP"
cd ..

# 3. Create Ansible Inventory (with group header)
echo "[minecraft]" > ansible/hosts.ini
echo "$INSTANCE_IP" >> ansible/hosts.ini

# 4. Ansible Configuration
echo "Configuring the server with Ansible..."
cd ansible
ansible-playbook -i hosts.ini playbook.yml --private-key ~/MyLinuxKey.pem
cd ..

echo "Deployment complete!"
echo "Your Minecraft server is now running at $INSTANCE_IP:25565"
