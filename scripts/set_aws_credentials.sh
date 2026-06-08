#!/bin/bash
echo "Set your AWS credentials below (from AWS Academy Learner Lab -> AWS Details):"
read -p "AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
read -p "AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
read -p "AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

echo "AWS credentials set for this session."
