variable "libvirt_volume_name" {
  description = "The name of the libvirt volume to use"
}

variable "libvirt-pool" {
  description = "The name of the libvirt storage pool to use"
  default     = "virt-u01"
}

variable "ip_address" {
  description = "The ip address of the machine"
  type        = string
  default     = "192.168.122.98"
}

variable "image_path" {
  description = "The path to the image to use"
  default     = "/u01/os_images/jammy-server-cloudimg-amd64.img"
}

variable "cloud_init_user_data_path" {
  description = "The path to the cloud-init user data file"
  default     = "templates/cloud-init.cfg"
}

variable "network_config_path" {
  description = "The path to the network config file"
  default     = "templates/network-config.cfg"
}

variable "vm_name" {
  description = "The name of the virtual machine"
}

variable "vm_memory" {
  description = "The amount of memory to allocate to the virtual machine in MB"

  validation {
    condition     = var.vm_memory > 0
    error_message = "Memory must be greater than 0"
  }
}

variable "vm_vcpu" {
  description = "The number of virtual CPUs to allocate to the virtual machine"

  validation {
    condition     = var.vm_vcpu > 0
    error_message = "vCPU must be greater than 0"
  }
}

variable "number_of_vms" {
  description = "The number of virtual machines to create"
  type        = number

  validation {
    condition     = var.number_of_vms > 0
    error_message = "Number of VMs must be greater than 0"
  }

}

variable "vm_disk_size" {
  description = "The size of the disk to allocate to the virtual machine"
  type        = number
  validation {
    condition     = var.vm_disk_size > 5
    error_message = "Disk size must be greater than 5GB"
  }
}