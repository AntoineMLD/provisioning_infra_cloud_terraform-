output "vm_public_ip" {
  value = module.vm.public_ip
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "webapp_url" {
  value = module.webapp.webapp_url
}