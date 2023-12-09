.PHONY: plan apply install destroy

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

install: apply



