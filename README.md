# Desafio MultiCloud, DevOps & IA Challenge

Creation of a multicloud environment, setup, and deployment applying the DevOps discipline with AI agents.

1. Execution

```
terraform init
terraform apply -var="my_ip=$(curl -s ifconfig.me)" -var="git_repo=GIT_REPO_URL"
```
