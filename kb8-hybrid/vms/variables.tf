variable "app_name" {
  default = "kb8"
}

variable "company_name" {
  default = "edf"
}

variable "env" {
  default = "prd"
}

variable "tenancy_ocid" {}

variable "availability_domain" {
  description = "ad1, ad2 or ad3"
  type        = string
  default     = "ad2"
}