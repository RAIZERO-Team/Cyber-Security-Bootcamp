#Create user ando add group souders

#step 1:Create a new user
sudo adduser mohamed

#step 2:
#Restart and login with the new user

#step 3:Switch to the kali user
su -kali

#step 4:Add the new user to the sudo group
sudo adduser mohamed sudo

#step 5:Switch to the new user
su - mohamed

#step 6:Upgrade the system
sudo apt upgrade

#step 7: Switch to the root user
su - root

#step 8:Edit the sudoers file
sudo visudo

#step 9:Add the new user to the sudoers file
mohamed  ALL=(ALL:ALL) ALL
