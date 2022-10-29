variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgCe5qKv9yEUlk7JxMXGhfOMxDcQmmgJpmJ/ENcoehDodMpBre7fT5uRzkKzv000UVT0NJlh8IobSZaPkTs+4Ko89HUtIoekd2ygyAcwg2g3UL/quaXjgC58QzsQ2NrC76O/lgg4XZE/XB40TmLt+mdc6AW+Py243q/3GhdMVwAkB26WxTdCC13r0oyCVC9rlxuZfEqQDUeYV7Uhem1u/g0Hokex3iPtvOPqyP2q3nrTjU8S1ln+9U9vEyMt3GSN2AIOc6DlXZrHlZD62Pv7H9E1rJd3exFKvv22Ah2T28yWjAfcQpyWN6KzIg72N0W5uWtYq7qi1xJGIyWJ5JwbZL+5srd7FHHx/xPzV/LxlaKOI4G+nGJML3NU+x8L1AyJQw00kIvMIq0CkfprBSgJAwlzyABAbcTOCNgGGQ4qQ1w0JmrIEgF97yk8gZRs6so1aJEkPYONkQksPJRyXIrpV3iMO2X0/MS9bBWhZ6JtMGynMScp0xtwDXV4lP38oduwU= max@max.example.com"
}
variable "ssh_key2" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFb/6E7qJrulFAVRkrwQcDZY6m57pj3TIIpxZCVNpoiy ansible"
}
variable "proxmox_host" {
  default = "pve2"
}
variable "template_name" {
  default = "ubuntu-2004-cloudinit-template3"
}