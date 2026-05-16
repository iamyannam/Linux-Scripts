Task --
We have a backup management application UI hosted on Nautilus's backup server in Stratos DC. That backup management application code is deployed under Apache on the backup server itself, and Nginx is running as a reverse proxy on the same server. Apache and Nginx ports are 5003 and 8094, respectively. We have to install the iptables firewall on the server. Make the appropriate changes to fulfill the requirements mentioned below:
We want to open all incoming connections to Nginx's port and block all incoming connections to Apache's port. Also make sure rules are permanent.

Solution --

ssh clint@stbkp01
yum update -y && yum install iptables -y && systemctl start iptables && systemctl enable iptables 
# Allow incoming traffic to Nginx
sudo iptables -A INPUT -p tcp --dport 8094 -j ACCEPT

# Block incoming traffic to Apache
sudo iptables -A INPUT -p tcp --dport 5003 -j DROP

iptables-save > /etc/sysconfig/iptables
iptables -L -n
