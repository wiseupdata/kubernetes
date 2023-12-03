resource "oci_containerengine_cluster" "k8s_cluster" {
  compartment_id     = var.compartment_ocid
  kubernetes_version = var.oke["version"]
  name               = var.oke["name"]
  vcn_id             = oci_core_vcn.oke_vcn.id
  options {
    service_lb_subnet_ids = ["${oci_core_subnet.LoadBalancerSubnetAD1.id}", "${oci_core_subnet.LoadBalancerSubnetAD2.id}"]
  }
}

resource "oci_containerengine_node_pool" "k8s_node_pool" {
  cluster_id         = oci_containerengine_cluster.k8s_cluster.id
  compartment_id     = var.compartment_ocid
  kubernetes_version = var.oke["version"]
  name               = var.oke["name"]
  node_shape         = var.oke["shape"]
  subnet_ids         = ["${oci_core_subnet.workerSubnetAD1.id}", "${oci_core_subnet.workerSubnetAD2.id}", "${oci_core_subnet.workerSubnetAD3.id}"]

  quantity_per_subnet = var.oke["nodes_per_subnet"]
  ssh_public_key      = file(var.ssh_public_key_file)

  node_source_details {
    source_type             = "image"
    image_id                = var.image_id
    boot_volume_size_in_gbs = var.storage_size
  }

  node_shape_config {
    memory_in_gbs = var.memory_size
    ocpus         = var.cpu_size
  }

}

data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id    = oci_containerengine_cluster.k8s_cluster.id
  expiration    = 2592000
  token_version = "2.0.0"
}

resource "local_file" "kubeconfig" {
  content  = data.oci_containerengine_cluster_kube_config.cluster_kube_config.content
  filename = "${path.module}/kubeconfig"
}
