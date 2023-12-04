module "vm_cluster_free_tier" {
  source              = "wiseupdata/vm_cluster_free_tier/oci"
  version             = "0.0.1"
  tenancy_ocid        = var.tenancy_ocid
  app_name            = var.company_name
  env                 = var.env
  company_name        = var.app_name
  availability_domain = var.availability_domain
}

module "local_outputs" {
  source         = "./modules/local"
  oci_ip_masters = module.vm_cluster_free_tier.ip_masters
  oci_ip_nodes   = module.vm_cluster_free_tier.ip_nodes
}
