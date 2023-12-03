variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "ssh_public_key_file" {}
variable "region" {}

variable "availability_domain" {
  default = "2"
}

variable "internet_gateway_enabled" {
  default = "true"
}

variable "oke" {
  type = map(string)

  default = {
    name             = "oke"
    version          = "v1.24.1"
    shape            = "VM.Standard.A1.Flex"
    nodes_per_subnet = 1
  }
}

variable "network_cidrs" {
  type = map(string)

  default = {
    vcnCIDR               = "10.0.0.0/16"
    workerSubnetAD1       = "10.0.10.0/24"
    workerSubnetAD2       = "10.0.11.0/24"
    workerSubnetAD3       = "10.0.12.0/24"
    LoadBalancerSubnetAD1 = "10.0.20.0/24"
    LoadBalancerSubnetAD2 = "10.0.21.0/24"
    LoadBalancerSubnetAD3 = "10.0.22.0/24"
  }
}

variable "image_id" {
  default = "ocid1.image.oc1.iad.aaaaaaaa375cunsngyvpdfjzqrxoyhhuwxscwysljwla563zcy3w3pqxtmuq"
}

variable "storage_size" {
  default = "50"
}

variable "memory_size" {
  default = "6"
}

variable "cpu_size" {
  default = "2"
}

variable "image_version" {
  default = "22.04"
}

variable "shape" {
  default = "VM.Standard.A1.Flex"
}
