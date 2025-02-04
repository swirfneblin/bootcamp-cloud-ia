# Desafio MultiCloud, DevOps & IA Challenge

Creation of a multicloud environment, setup, and deployment applying the DevOps discipline with AI agents.

1. Prerequisite

- [Create IAM user](https://docs.aws.amazon.com/streams/latest/dev/setting-up.html) with programatic ssh-key pair;
- [Install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) AWS Cli

2. Execution

```
git clone https://github.com/swirfneblin/bootcamp-cloud-ia.git
cd bootcamp-cloud-ia/terraform

terraform init
terraform apply --auto-approve
```

3. Destroy resources

```
terraform destroy --auto-approve
```
