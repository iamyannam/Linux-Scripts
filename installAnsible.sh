Install ansible version 4.10.0 on Jump host using pip3 only. Make sure Ansible binary is available globally on this system, i.e all users on this system are able to run Ansible commands.

Solution --
1. Check Python version using python3 --version or pip3 --version
2.sudo apt update
sudo apt install -y python3 python3-pip
3. sudo pip3 install ansible==4.10.0
4. check Ansible version using ansibel --version
5. chec for global path - which ansible & echo $PATH
