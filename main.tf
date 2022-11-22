terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://:87.79.240.210:8006/api2/json"
  pm_api_token_id = "blog_example@pam!new_token_id"
  pm_api_token_secret = "47e03114-d1c2-4ccb-aabc-e90267329bba"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "test_master" {
  count = 1

  name = "master-${count.index + 1}"
  target_node = var.proxmox_host
  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 1
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.178.9${count.index + 1}/24,gw=192.168.178.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  ${var.ssh_key2}
  EOF
}

resource "proxmox_vm_qemu" "test_worker" {
  count = 0
  name = "worker-${count.index + 1}"
  target_node = var.proxmox_host
  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = 4
  sockets = 1
  cpu = "host"
  memory = 4096
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 1
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.178.10${count.index + 1}/24,gw=192.168.178.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  ${var.ssh_key2}
  EOF
}
