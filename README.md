# Overview  aws-fargate-101

Please see blog site https://devbuildit.com/2024/06/04/monitoring-amazon-lambda-functions/ for detailed explaination of this repo contents.

This repo (and associated blog) will help you access the shell prompt on Fargate containers

There two parts to repo:
  1) Docker file creation and upload
  2) Terraform code to deploy a Fargate Container and access its command shell


# Installation  

Please see https://devbuildit.com/2024/06/04/monitoring-amazon-lambda-functions for detailed explaination.

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

## Deployment - TF
- change to TF subfolder in Github repo
- setup AWS credentials
- run deploy.sh