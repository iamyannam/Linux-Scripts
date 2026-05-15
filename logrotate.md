Task -- 
a. In all app servers install tomcat package. b. Using logrotate configure tomcat logs rotation to monthly and keep only 3 rotated logs.

Solution --
install tomact using below for loop and do the logrotate step.
for service in steve@stapp02 banner@stapp03
do
   ssh -t $service "sudo yum install logrotate -y && \
echo '/var/log/tomcat/*.log {
    monthly
    rotate 3
    missingok
    notifempty
    compress
    delaycompress
    copytruncate
}' | sudo tee /etc/logrotate.d/tomcat > /dev/null && \
sudo logrotate -d /etc/logrotate.d/tomcat && sudo logrotate -f /etc/logrotate.d/tomcat && ls -l /var/log/tomcat*"
done
