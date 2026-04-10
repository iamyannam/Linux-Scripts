Install httpd on all appservers.

Solution: 
for service in user1@app01 user2@app02 user3@app03
do
   ssh -t $service "sudo yum update -y && sudo yum install httpd -y && sudo systemctl start httpd && sudo systemctl enable httpd && sudo systemctl status httpd"
done

Note - -t is for passing a key in the terminal when prompted
