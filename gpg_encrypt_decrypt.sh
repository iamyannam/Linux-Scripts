Task -----
On storage server in Stratos Datacenter we have private and public keys stored at /home/*_key.asc. Use these keys to perform the following actions.
- Encrypt /home/encrypt_me.txt to /home/encrypted_me.asc.
- Decrypt /home/decrypt_me.asc to /home/decrypted_me.txt. (Passphrase for decryption and encryption is kodekloud).
- The user ID you can use is kodekloud@kodekloud.com.

Solution ----

[natasha@ststor01 home]$ gpg --import /home/*_key.asc
gpg: directory '/home/natasha/.gnupg' created
gpg: keybox '/home/natasha/.gnupg/pubring.kbx' created
gpg: /home/natasha/.gnupg/trustdb.gpg: trustdb created
gpg: key 8F17F26ECCE3AF51: public key "kodekloud <kodekloud@kodekloud.com>" imported
gpg: key 8F17F26ECCE3AF51: secret key imported
gpg: key 8F17F26ECCE3AF51: "kodekloud <kodekloud@kodekloud.com>" not changed
gpg: Total number processed: 2
gpg:               imported: 1
gpg:              unchanged: 1
gpg:       secret keys read: 1
gpg:   secret keys imported: 1

##########Encryption###################
sudo GNUPGHOME=/home/natasha/.gnupg gpg --batch --yes --pinentry-mode loopback \
  --passphrase kodekloud \
  --output /home/encrypted_me.asc \
  --armor --encrypt \
  --recipient kodekloud@kodekloud.com \
  /home/encrypt_me.txt

##########Decryprion###################
sudo GNUPGHOME=/home/natasha/.gnupg gpg --batch --yes --pinentry-mode loopback \
  --passphrase kodekloud \
  --output /home/decrypted_me.txt \
  --decrypt /home/decrypt_me.asc
