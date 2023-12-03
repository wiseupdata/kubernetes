
resource "local_file" "inventory" {
  content  = <<-EOT
  cluster:
    children:
      master:
        hosts:
          vpn_master:
            ansible_ssh_user: ubuntu
            ansible_host: ${var.oci_ip_masters}
            ansible_ssh_port: 22
            ansible_ssh_private_key_file: "~/.ssh/id_rsa"
            ansible_host_key_checking: false
      node:
        hosts:
          vpn_node_1:
            ansible_ssh_user: ubuntu
            ansible_host: ${var.oci_ip_nodes}
            ansible_ssh_port: 22
            ansible_ssh_private_key_file: "~/.ssh/id_rsa"
            ansible_host_key_checking: false
          vpn_node_2:
            become: true
            ansible_host: 127.0.0.1
            ansible_connection: local
            ansible_host_key_checking: false
            ansible_python_interpreter: "{{ansible_playbook_python}}"
  EOT
  filename = "${path.root}/../wireguard/inventory/vm-cluster/hosts.yml"
}



