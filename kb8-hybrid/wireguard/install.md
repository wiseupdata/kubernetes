# **APP Installation**

> Home directory👍

```bash
cd $HOME/public/kubernetes/kb8-hybrid/wireguard && clear
```

# Install App
> Add the hosts to the inventory file


# Check the connection to the Machines

> Using Make
```bash
make ping
```

or

```bash
ansible -i inventory/vm-cluster/hosts.yml master -m ping 
ansible -i inventory/vm-cluster/hosts.yml node -m ping 
ansible -i inventory/vm-cluster/hosts.yml cluster -m ping 
```


# run play book

```bash
make install
```

or

```bash
export SUDO_PASS='mypwd'
clear && ansible-playbook site.yml -i inventory/vm-cluster/hosts.yml -v --extra-vars 'sudo_pass=$SUDO_PASS'
```


# Utils

```bash
clear && ansible-playbook site.yml -i inventory/vm-cluster/hosts.yml -v --ask-become-pass 
```

```bash
ansible-vault encrypt_string test 'test' --name 'ansible_sudo_pass_ec'
```

# References

1. https://jawher.me/wireguard-ansible-systemd-ubuntu/
1. https://dev.to/tangramvision/exploring-ansible-via-setting-up-a-wireguard-vpn-3389
1. https://github.com/namm2/wireguard
1. https://www.reddit.com/r/WireGuard/comments/a9ds9p/i_wrote_an_ansible_playbook_to_install_and_manage/
1. https://github.com/githubixx/ansible-role-wireguard
