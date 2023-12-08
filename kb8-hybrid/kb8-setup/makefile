.PHONY: ping delete install

# Test the connection with your cluster
ping:
	@echo "\n[K3S] - Testing the VPN IP of your cluster\n"
	@ansible -i inventory/vm-cluster/hosts.yml master -m ping 

run:
	@echo "\n[K3S] - Running the ansbile playbook\n" 
	@ansible-playbook apply.yml -i inventory/vm-cluster/hosts.yml

install:
	@make run

