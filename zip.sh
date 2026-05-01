#!/bin/bash

#### Install ZIP Package ######
#echo " Install ZIP"
#yum install zip -y

### Create a zip archive named xfusioncorp_official.zip of /var/www/html/official directory #####
echo "ZIP is done"
zip -r xfusioncorp_official.zip /var/www/html/official

#### Save this in backup location #####
echo "backup ZIP files"
cp xfusioncorp_official.zip /backup/

##### Copy the created archive to Nautilus Storage Server server in /backup/ location ##
echo "copy to storage location server"
scp /backup/xfusioncorp_official.zip natasha@ststor01:/backup/
