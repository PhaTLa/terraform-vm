# Create base volume for the VM
resource "libvirt_volume" "ubuntu-qcow2" {
  name   = "${var.libvirt_volume_name}-base"
  pool   = var.libvirt-pool
  # source = "file:///u01/os_images/jammy-server-cloudimg-amd64.img"
  source = var.image_path
  format = "qcow2"
}

resource "libvirt_volume" "disk_volume" {
  count = var.number_of_vms
  name = "${var.libvirt_volume_name}-${count.index}-disk"
  size = var.vm_disk_size
  pool = var.libvirt-pool
  base_volume_id = libvirt_volume.ubuntu-qcow2.id
  format = "qcow2"
}

data "template_file" "user_data" {
  #   template = file("${path.module}/cloud_init.cfg")
  count = var.number_of_vms
  template = file("${var.cloud_init_user_data_path}")
  vars = {
    vm_name = var.vm_name
    count_index = count.index
  }
}

data "template_file" "network_config" {
  template = file("${var.network_config_path}")
}

# for more info about paramater check this out
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/website/docs/r/cloudinit.html.markdown
# Use CloudInit to add our ssh-key to the instance
# you can add also meta_data field
resource "libvirt_cloudinit_disk" "commoninit" {
  count = var.number_of_vms
  name           = "commoninit-${var.vm_name}-${count.index}.iso"
  user_data      = data.template_file.user_data[count.index].rendered
  network_config = data.template_file.network_config.rendered
  pool           = var.libvirt-pool
}

# Create the machine
resource "libvirt_domain" "domain-ubuntu" {
  count = var.number_of_vms
  name   = "${var.vm_name}-${count.index}"
  memory = var.vm_memory # in MB
  vcpu   = var.vm_vcpu

  cloudinit = libvirt_cloudinit_disk.commoninit[count.index].id

  network_interface {
    network_name = "default"
    hostname = var.vm_name
    wait_for_lease = true
  }

  # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it
  # https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.disk_volume[count.index].id
  }

  #   graphics {
  #     type        = "spice"
  #     listen_type = "address"
  #     autoport    = true
  #   }
}

output "created_network_interface" {
  value = [for instance in libvirt_domain.domain-ubuntu : instance.network_interface[0].addresses[0]]
}