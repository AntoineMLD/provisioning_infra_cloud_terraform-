variable "resource_group_name" {
  description = "Nom du resource group Azure"
  type        = string
  default     = "amoulardRG"
}

variable "admin_username" {
  description = "Nom utilisateur admin VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Chemin clé SSH publique"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}