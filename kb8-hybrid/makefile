# Makefile

# Load variables from .env file
include .env
export $(shell sed 's/=.*//' .env)

.PHONY: install update plan apply destroy ping

########### Destroy Commands ################ Start >>#
k3s_destroy:
	@echo "\nRunning K3s destroy"
	$(MAKE) -C ./k3s destroy 

wireguard_destroy:
	@echo "\nRunning Wireguard destroy"
	$(MAKE) -C ./k3s destroy 

terraform_destroy:
	@echo "\nRunning Terraform destroy, region $$TF_VAR_region\n\n"
	@$(foreach var,$(shell cat .env), export $(var) &&) $(MAKE) -C ./vms destroy
###########################<< End #


########### Install Commands ################ Start >>#
install_terraform:
	@$(foreach var,$(shell cat .env), export $(var) &&) $(MAKE) -C ./vms install
	@echo "\nWaiting 1 minutes for the VM to start...\n"
	@sleep 60
	@echo "VM should be up now."

install_wireguard:
	$(MAKE) -C ./wireguard install
	@echo "\nWaiting 30 seconds for the wireguard start...\n"
	@ping -c 2 -W 2 10.8.0.3
	@sleep 60
	@echo "Wireguard should be up now." 

install_k3s:
	-$(MAKE) -C ./k3s install || ($(MAKE) -C ./k3s install && @echo "k3s installation succeeded on retry.")
	@echo "Setup Kb8" 
###########################<< End #


########### Setup Commands ################ Start >>#
kb8_setup:
	$(MAKE) -C ./kb8-setup install
###########################<< End #

install: install_terraform install_wireguard install_k3s kb8_setup


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

destroy: k3s_destroy wireguard_destroy terraform_destroy

ping:
	$(MAKE) -C ./wireguard ping
	$(MAKE) -C ./k3s ping
	