.PHONY: install uninstall destroy plan ping

install:
	$(MAKE) -C ./vms install 
	$(MAKE) -C ./wireguard install 

# Terraform plan
plan:
	$(MAKE) -C ./vms plan

# Terraform apply
apply:
	$(MAKE) -C ./vms apply

# Terraform destroy
# No need to destroy the wireguard or k3s because those are installed in the VMs
destroy:
	$(MAKE) -C ./wireguard destroy 
	$(MAKE) -C ./vms destroy

ping:
	$(MAKE) -C ./wireguard ping
	$(MAKE) -C ./k3s ping
	
# $(MAKE) -C ./k3s install