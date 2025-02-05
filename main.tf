# module "webserver" {
#   source              = "./modules/vm"
#   libvirt_volume_name = var.libvirt_volume_name
#   libvirt-pool        = var.libvirt-pool
#   #   ip_address                = var.ip_address
#   image_path                = var.image_path
#   cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
#   network_config_path       = "${path.module}/${var.network_config_path}"
#   vm_name                   = var.vm_name
#   vm_memory                 = var.vm_memory
#   vm_vcpu                   = var.vm_vcpu
#   number_of_vms             = var.number_of_vms
#   vm_disk_size              = var.vm_disk_size
# }

module "hadoop_master" {
  source              = "./modules/vm"
  libvirt_volume_name = "${var.libvirt_volume_name}-master"
  libvirt-pool        = var.libvirt-pool
  #   ip_address                = var.ip_address
  image_path                = var.image_path
  cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
  network_config_path       = "${path.module}/${var.network_config_path}"
  vm_name                   = "${var.vm_name}-master"
  vm_memory                 = var.vm_memory
  vm_vcpu                   = var.vm_vcpu
  number_of_vms             = 1
  vm_disk_size              = var.vm_disk_size
}

module "hadoop_slaves" {
  source              = "./modules/vm"
  libvirt_volume_name = "${var.libvirt_volume_name}-slave"
  libvirt-pool        = var.libvirt-pool
  #   ip_address                = var.ip_address
  image_path                = var.image_path
  cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
  network_config_path       = "${path.module}/${var.network_config_path}"
  vm_name                   = "${var.vm_name}-slaves"
  vm_memory                 = var.vm_memory
  vm_vcpu                   = var.vm_vcpu
  number_of_vms             = 2
  vm_disk_size              = var.vm_disk_size
}

output "created_ip_address" {
  value = "Master: ${join(", ", module.hadoop_master.created_network_interface)} \nSlaves: ${join(", ", module.hadoop_slaves.created_network_interface)}"
}