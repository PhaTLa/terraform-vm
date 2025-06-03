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

# module "hadoop_master" {
#   source              = "./modules/vm"
#   libvirt_volume_name = "${var.libvirt_volume_name}-master"
#   libvirt-pool        = var.libvirt-pool
#   #   ip_address                = var.ip_address
#   image_path                = var.image_path
#   cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
#   network_config_path       = "${path.module}/${var.network_config_path}"
#   vm_name                   = "${var.vm_name}-master"
#   vm_memory                 = var.vm_memory
#   vm_vcpu                   = var.vm_vcpu
#   number_of_vms             = 1
#   vm_disk_size              = var.vm_disk_size
# }

# module "hadoop_slaves" {
#   source              = "./modules/vm"
#   libvirt_volume_name = "${var.libvirt_volume_name}-slave"
#   libvirt-pool        = var.libvirt-pool
#   #   ip_address                = var.ip_address
#   image_path                = var.image_path
#   cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
#   network_config_path       = "${path.module}/${var.network_config_path}"
#   vm_name                   = "${var.vm_name}-slaves"
#   vm_memory                 = var.vm_memory
#   vm_vcpu                   = var.vm_vcpu
#   number_of_vms             = 2
#   vm_disk_size              = var.vm_disk_size
# }

# module "apache_hive" {
#   source              = "./modules/vm"
#   libvirt_volume_name = "hive-server"
#   libvirt-pool        = var.libvirt-pool
#   #   ip_address                = var.ip_address
#   image_path                = var.image_path
#   cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
#   network_config_path       = "${path.module}/${var.network_config_path}"
#   vm_name                   = "hive-server"
#   vm_memory                 = 8192
#   vm_vcpu                   = 2
#   number_of_vms             = 1
#   vm_disk_size              = 21474836480
# }

# module "apache_spark" {
#   source              = "./modules/vm"
#   libvirt_volume_name = "spark-server"
#   libvirt-pool        = var.libvirt-pool
#   #   ip_address                = var.ip_address
#   image_path                = var.image_path
#   cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
#   network_config_path       = "${path.module}/${var.network_config_path}"
#   vm_name                   = "spark-server"
#   vm_memory                 = 16384
#   vm_vcpu                   = 4
#   number_of_vms             = 2
#   vm_disk_size              = 21474836480
# }

module "keycloak" {
  source              = "./modules/vm"
  libvirt_volume_name = "keycloak-server"
  libvirt-pool        = var.libvirt-pool
  #   ip_address                = var.ip_address
  image_path                = var.image_path
  cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
  network_config_path       = "${path.module}/${var.network_config_path}"
  vm_name                   = "keycloak-server"
  vm_memory                 = 8192
  vm_vcpu                   = 2
  number_of_vms             = 1
  vm_disk_size              = 21474836480
}

module "k8smaster" {
  source              = "./modules/vm"
  libvirt_volume_name = "k8s-master"
  libvirt-pool        = var.libvirt-pool
  #   ip_address                = var.ip_address
  image_path                = var.image_path
  cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
  network_config_path       = "${path.module}/${var.network_config_path}"
  vm_name                   = "k8s-master"
  vm_memory                 = 4096
  vm_vcpu                   = 2
  number_of_vms             = 1
  vm_disk_size              = 10737418240
}

module "k8sworker" {
  source              = "./modules/vm"
  libvirt_volume_name = "k8s-worker"
  libvirt-pool        = var.libvirt-pool
  #   ip_address                = var.ip_address
  image_path                = var.image_path
  cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
  network_config_path       = "${path.module}/${var.network_config_path}"
  vm_name                   = "k8s-worker"
  vm_memory                 = 8192
  vm_vcpu                   = 4
  number_of_vms             = 2
  vm_disk_size              = 21474836480
}


module "gitlab" {
  source              = "./modules/vm"
  libvirt_volume_name = "gitlab"
  libvirt-pool        = var.libvirt-pool
  #   ip_address                = var.ip_address
  image_path                = var.image_path
  cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
  network_config_path       = "${path.module}/${var.network_config_path}"
  vm_name                   = "gitlab"
  vm_memory                 = 16384
  vm_vcpu                   = 4
  number_of_vms             = 1
  vm_disk_size              = 32212254720
}

module "minio" {
  source              = "./modules/vm"
  libvirt_volume_name = "minio"
  libvirt-pool        = var.libvirt-pool
  #   ip_address                = var.ip_address
  image_path                = var.image_path
  cloud_init_user_data_path = "${path.module}/${var.cloud_init_user_data_path}"
  network_config_path       = "${path.module}/${var.network_config_path}"
  vm_name                   = "minio"
  vm_memory                 = 4096
  vm_vcpu                   = 2
  number_of_vms             = 1
  vm_disk_size              = 10737418240
}

# output "created_ip_address" {
#   value = "Master: ${join(", ", module.hadoop_master.created_network_interface)} \nSlaves: ${join(", ", module.hadoop_slaves.created_network_interface)}"
# }

# output "hive_server_ip_address" {
#   value = "Hive Server: ${join(", ", module.apache_hive.created_network_interface)}"
# }

# output "spark_server_ip_address" {
#   value = "Spark Server: ${join(", ", module.apache_spark.created_network_interface)}"
# }

output "keycloak_server_ip_address" {
  value = "keycloak Server: ${join(", ", module.keycloak.created_network_interface)}"
}

output "k8s_master_ip_address" {
  value = "K8s Master: ${join(", ", module.k8smaster.created_network_interface)}"
}
output "k8s_worker_ip_address" {
  value = "K8s Worker: ${join(", ", module.k8sworker.created_network_interface)}"
}
output "gitlab_ip_address" {
  value = "Gitlab Server: ${join(", ", module.gitlab.created_network_interface)}"
}

output "minio_ip_address" {
  value = "Minio Server: ${join(", ", module.minio.created_network_interface)}"
}