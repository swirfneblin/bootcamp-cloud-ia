#!/bin/bash
if [ ! -f .env ]; then
  echo "Erro: Arquivo .env não encontrado!"
  exit 1
fi

> terraform.tfvars

while IFS='=' read -r key value || [[ -n "$key" ]]; do
  [[ -z "$key" || "$key" =~ ^# ]] && continue
  key_lower=$(echo "$key" | tr '[:upper:]' '[:lower:]')
  echo "$key_lower = \"$value\"" >> terraform.tfvars
done < .env

echo "Arquivo terraform.vars gerado!"