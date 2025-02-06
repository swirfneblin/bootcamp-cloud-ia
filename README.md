# Desafio MultiCloud, DevOps & IA Challenge

Creation of a multicloud environment, setup, and deployment applying the DevOps discipline with AI agents.

## Prerequisite

- [Create IAM user](https://docs.aws.amazon.com/streams/latest/dev/setting-up.html) with programatic ssh-key pair and admin access;
- [Install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) AWS Cli
- [Configure](https://kubernetes.io/docs/tasks/tools/) Kubectl Cli

## Execution

### 1. Clone repository

```
git clone https://github.com/swirfneblin/bootcamp-cloud-ia.git
cd bootcamp-cloud-ia
```

### 2. Prepare

Create a file `.env` with variables and execute the following command to generate `terraform.vars` file

```
chmod +x generate_tfvars.sh
./generate_tfvars.sh
```

### 3. Execution

```
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars --auto-approve

# To destroy all resources
terraform destroy -var-file=terraform.tfvars --auto-approve
```
