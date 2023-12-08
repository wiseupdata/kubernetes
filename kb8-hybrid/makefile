.PHONY: install update plan apply destroy ping

install:
	$(MAKE) -C ./vms install
	@echo "\nWaiting 1 minutes for the VM to start...\n"
	@sleep 60
	@echo "VM should be up now." 
	$(MAKE) -C ./wireguard install
	@echo "\nWaiting 30 seconds for the wireguard start...\n"
	@ping -c 2 -W 2 10.8.0.3
	@sleep 60
	@echo "VM should be up now." 
	$(MAKE) -C ./k3s install
	@echo "Setup Kb8" 
	$(MAKE) -C ./kb8-setup install

update:
	$(MAKE) -C ./vms install
	$(MAKE) -C ./wireguard install
	$(MAKE) -C ./k3s install
	$(MAKE) -C ./kb8-setup install

# Terraform plan
plan:
	$(MAKE) -C ./vms plan

# Terraform apply
apply:
	$(MAKE) -C ./vms apply

# Terraform destroy
# No need to destroy the wireguard or k3s because those are installed in the VMs
destroy:
	$(MAKE) -C ./k3s destroy 
	$(MAKE) -C ./wireguard destroy 
	$(MAKE) -C ./vms destroy

ping:
	$(MAKE) -C ./wireguard ping
	$(MAKE) -C ./k3s ping
	