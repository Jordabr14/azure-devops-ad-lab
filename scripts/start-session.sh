#!/usr/bin/env bash
# Uso (desde la raiz del repo): source scripts/start-session.sh

# 1. Sesion de Azure: si el token no sirve, pide login
if ! az account get-access-token --query expiresOn -o tsv > /dev/null 2>&1; then
  echo "Sesion de Azure invalida, iniciando login..."
  az login --use-device-code
fi

# 2. Suscripcion para Terraform
export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)

# 3. Tu IP actual: actualiza solo esa linea del tfvars (la password no se toca)
MI_IP=$(curl -4 -s --max-time 10 https://api.ipify.org)
if [ -n "$MI_IP" ]; then
  sed -i "s|^admin_source_ip.*|admin_source_ip = \"${MI_IP}/32\"|" ~/azure-devops-ad-lab/terraform/terraform.tfvars
fi
echo "Suscripcion lista. IP actual: [$MI_IP]"
