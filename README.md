# Overview  aws-fargate-101

Please see blog site https://devbuildit.com/2024/08/13/aws-fargate-101/ for detailed explaination of this repo contents.

This repo (and associated blog post) will help you to access your operating system shell prompt within a AWS Fargate containers.

There are two parts to this repo:
  1) Docker file creation and upload (contained within the Docker subflolder)
  2) Terraform code to deploy a Fargate Container and access its command shell (contained within the TF subflolder)

# Installation  

## Requirements: ##
- AWS Account
- Terraform CLI installed with access to your target AWS account (via temporary Indentity centre credentials or AWS IAM access keys)

## Deployment - TF
- Clone this github repo into a source folder
- switch to TF subfolder in github repo
- Setup AWS credentials
- Update file variable with default region (otherwise this will deploy to ap-southeast-2 by default) in file terraform.tfvars
- Consider changing application name in file variables.tf (default will work fine)
- Run command 'Terraform init' in source folder
- Run command 'Terraform plan' in source folder
- Run command 'Terraform apply' in source folder and approve apply

## Deployment - Docker Image
- change to Docker subfolder within the Github repo
- setup AWS credentials
- Update variables in deploy.sh script: AWS region, AWS ECR name; Cocker image name.
- run deploy.sh