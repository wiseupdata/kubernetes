# Define the files to be deleted
FILES := .terraform.lock.hcl .terraform terraform.tfstate terraform.tfstate.backup

.PHONY: plan apply install destroy clear

# Terraform plan
plan:
	@echo "[TERRAFORM] - Planning"
	@terraform init
	@terraform validate
	@terraform fmt --recursive
	@terraform plan

# Terraform deploy
apply:
	@echo "[TERRAFORM] - Applying"
	@terraform init
	@terraform validate
	@terraform fmt --recursive
	@terraform apply --auto-approve

# Terraform deploy
destroy:
	@echo "[TERRAFORM] - Destroying $$TF_VAR_region"
	@terraform destroy --auto-approve
	@echo "Deleting files: $(FILES)"
	@rm -Rf $(FILES)

install: apply

clear:
	@clear
	@echo "Deleting files: $(FILES)"
	@rm -Rf $(FILES)
