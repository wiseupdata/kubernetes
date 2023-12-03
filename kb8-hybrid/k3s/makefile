# Test the connection with your cluster
ping:
	@echo "\n[K3S] - Testing the VPN IP of your cluster\n"
	@ansible -i inventory/vm-cluster/hosts.yml master -m ping 
	@ansible -i inventory/vm-cluster/hosts.yml node -m ping 

run:
	@echo "\n[K3S] - Running the ansbile playbook\n" 
	@ansible-playbook apply.yml -i inventory/vm-cluster/hosts.yml

install:
	@make run

destroy:
	@echo "\n[K3S] - Destroying the ansbile playbook \n" 
	@ansible-playbook destroy.yml -i inventory/vm-cluster/hosts.yml

.PHONY: ping destroy delete install