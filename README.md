# Provisioning Infrastructure Cloud avec Terraform

## Objectif

Déployer une infrastructure Azure basique via Terraform :
- **VM Linux** (Standard_B1s - 1 vCPU, 1 Go RAM)
- **Storage Account** + Blob Container
- **Web App** (plan F1 gratuit)

## Prérequis

- Azure CLI installé et connecté (`az login`)
- Terraform installé
- Clé SSH générée (`~/.ssh/id_rsa.pub`)

## Structure du projet

```
provisioning_infra_cloud_terraform/
├── main.tf              # Configuration principale + appel des modules
├── variables.tf         # Variables globales
├── outputs.tf           # Outputs (IP, URL, etc.)
└── modules/
    ├── vm/              # Module Machine Virtuelle
    ├── storage/         # Module Storage Account + Container
    └── webapp/          # Module Web App
```

## Utilisation

```bash
# Initialiser Terraform
terraform init

# Voir les changements prévus
terraform plan

# Déployer l'infrastructure
terraform apply

# Supprimer l'infrastructure
terraform destroy
```

## Ressources déployées

| Ressource | Description | SKU/Tier |
|-----------|-------------|----------|
| VM Linux | Ubuntu 22.04 LTS | Standard_B1s |
| Virtual Network | Réseau 10.0.0.0/16 | - |
| Storage Account | Stockage blob | Standard_LRS |
| Blob Container | Container "data" | Private |
| Web App | App Linux vide | F1 (gratuit) |

## Variables

| Variable | Description | Défaut |
|----------|-------------|--------|
| `resource_group_name` | Resource Group Azure | `amoulardRG` |
| `admin_username` | User admin VM | `azureuser` |
| `ssh_public_key_path` | Chemin clé SSH | `~/.ssh/id_rsa.pub` |

## Outputs

- `vm_public_ip` : IP publique de la VM
- `storage_account_name` : Nom du Storage Account
- `webapp_url` : URL de la Web App

## Connexion à la VM

```bash
ssh azureuser@<vm_public_ip>
```

## Auteur

Antoine Moulard - Formation Data Engineer Simplon