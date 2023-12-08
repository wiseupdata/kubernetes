.PHONY: ping run install

ping:
	@echo "\n[WIREGUARD] - Testing the PUBLIC IP of in your cluster [Not in the VPN]\n"
	@ansible -i inventory/vm-cluster/hosts.yml master -m ping 
	@ansible -i inventory/vm-cluster/hosts.yml node -m ping 

run:
	@echo "\n[WIREGUARD] - Running the ansbile playbook\n" 
	@ansible-playbook site.yml -i inventory/vm-cluster/hosts.yml

install: run

destroy:
	@echo "\n[WIREGUARD] - Destroying the ansbile playbook \n" 
	@ansible-playbook destroy.yml -i inventory/vm-cluster/hosts.yml

unistall: destroy