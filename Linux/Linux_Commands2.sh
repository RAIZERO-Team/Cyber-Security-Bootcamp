#!/bin/bash

# 1. Hardware Information Commands

lscpu                  # Display the architecture of the CPU.
lsblk                  # Show information about all block devices.
lspci -tv              # Tree view of all PCI devices (graphics, network, etc.).
lsusb -tv              # Tree view of all USB devices connected to the system.
lshw                   # List detailed hardware configuration.
cat /proc/cpuinfo      # Access detailed CPU information from the system.
cat /proc/meminfo      # Get a deep dive into the system's memory usage.
cat /proc/mounts       # Display the currently mounted file systems.
free -h                # Show free and used memory in human-readable format.
sudo dmidecode         # Decode BIOS data for detailed hardware info.
hdparm -i /dev/sda     # Fetch device info for a specified disk.
hdparm -tT /dev/sda    # Test read speed for a specified disk.
badblocks -s /dev/sda  # Search for bad blocks on a disk.
fsck /dev/sda          # File system check for errors (only on unmounted disks).

# 2. Searching Commands

find /home -name "*.log"                # Locate all .log files under /home.
find /var -size +100M                   # Search for files larger than 100MB in /var.
grep "error" /var/log/syslog            # Search for 'error' in system logs.
grep -r "TODO" ~/projects               # Recursively find 'TODO' comments in project files.
locate "*.conf"                         # Quickly find configuration files.
which python3                           # Locate the path of python3 command.
whereis gcc                             # Find binary, source, and manual for gcc.
awk '/error/ {print $0}' /var/log/syslog # Print lines with 'error' in syslog.
sed 's/oldtext/newtext/' file.txt       # Replace 'oldtext' with 'newtext' in file.txt.

# 3. File Commands

mkdir backup                          # Create a new directory named 'backup'.
rm oldfile.txt                        # Remove 'oldfile.txt'.
rm -r old_directory                   # Remove a directory and its contents.
rm -rf /tmp/*                         # Forcibly remove everything in /tmp.
cp file1.txt backup/                  # Copy file1.txt to the backup directory.
cp -r /var/www/html /backup/          # Recursively copy the web server's HTML directory.
mv report.txt reports/                # Move report.txt into the reports directory.
ln -s /usr/bin/python3 /usr/local/bin/python  # Create a symbolic link to python3.
touch newfile.txt                     # Create an empty file named 'newfile.txt'.
cat notes.txt                         # Display the contents of 'notes.txt'.
cat logs.txt >> all_logs.txt          # Append logs.txt content to all_logs.txt.
head -n 5 myfile.txt                  # Show the first five lines of myfile.txt.
tail -n 5 myfile.txt                  # Display the last five lines of myfile.txt.
more largefile.txt                    # Page through a large file.
less largefile.txt                    # Similar to more, but with better navigation.
nano todo.txt                         # Edit 'todo.txt' using the nano editor.
vi README.md                          # Open or create a README file with Vi editor.
gpg -c secrets.txt                    # Encrypt the file 'secrets.txt'.
gpg secrets.txt.gpg                   # Decrypt 'secrets.txt.gpg'.
wc -w article.txt                     # Count the number of words in 'article.txt'.
ls | xargs wc                         # Count lines, words, and characters in files.
cut -d':' -f1 /etc/passwd             # Extract usernames from /etc/passwd.
shred -u confidential.txt             # Securely delete 'confidential.txt'.
diff oldfile.txt newfile.txt          # Compare two files and show differences.
source ~/.bashrc                      # Apply changes to the current shell session.
ls | tee output.txt                   # List files and store the result in 'output.txt'.

# 4. Directory Navigation Commands

ls                                   # List files in the current directory.
ls -a                                # Include hidden files in the listing.
ls -l                                # Detailed listing with permissions and sizes.
pwd                                  # Show the current working directory.
cd                                   # Change to the home directory.
cd ..                                # Move one level up.
cd -                                 # Switch back to the previous directory.
cd /var/www                          # Change to a specified directory.
dirs                                 # Show the directory stack.

# 5. File Compression Commands

tar cf archive.tar /path/to/folder   # Archive a folder without compression.
tar xf archive.tar                   # Extract an archived folder.
tar czf archive.tar.gz /folder       # Create a compressed tarball.
gzip largefile.txt                   # Compress 'largefile.txt'.
gunzip archive.tar.gz                # Decompress a gzip file.
bzip2 bigfile                        # Compress with bzip2.
bunzip2 bigfile.bz2                  # Decompress bzip2 archive.

# 6. File Transfer Commands

scp file.txt user@remote:/path/to/dest  # Securely copy a file to a remote host.
rsync -a /local/dir user@remote:/backup # Sync local directory to remote host.
wget http://example.com/file.zip        # Download a file from the web.
curl -O https://example.com/page.html   # Download a file with curl.
ftp ftp.example.com                     # Start an FTP session.
sftp user@remote                        # Secure FTP session with a remote server.

# 7. User and Group Commands

id                                 # Display user ID and group information.
last                               # Show login history.
who                                # Display who is logged in.
w                                  # Who is logged in and what they are doing.
finger user                        # Show information about a user.
sudo useradd alice                 # Add a new user 'alice'.
sudo adduser bob                   # Add a new user 'bob' with an interactive interface.
sudo userdel charlie               # Delete user 'charlie'.
sudo usermod -aG sudo alice        # Add 'alice' to the 'sudo' group.
passwd                             # Change your password.
sudo passwd dave                   # Change password for 'dave'.
sudo groupadd admins               # Create a new group 'admins'.
sudo groupdel guests               # Remove the group 'guests'.
sudo groupmod -n staff admins      # Rename 'admins' group to 'staff'.
sudo su -                          # Switch to the root user.
chgrp staff file.txt               # Change group ownership of 'file.txt'.

# 8. Package Installation Commands

sudo apt-get install git              # Install git using apt-get.
sudo apt install vim                  # Install vim using apt.
apt search python3                    # Search for a package containing 'python3'.
apt list --installed                  # List all installed packages.
apt show curl                         # Display information about 'curl' package.
sudo dpkg -i package.deb              # Install a .deb package directly.
sudo dpkg -l                          # List all installed .deb packages.

# 9. Red Hat-Based Distributions (CentOS, Fedora)

sudo yum install httpd                # Install Apache server with YUM.
yum search php                        # Search for PHP packages with YUM.
yum list installed                    # List installed packages via YUM.
yum info mysql                        # Get detailed info about MySQL package.
sudo dnf install nginx                # Install Nginx using DNF package manager.
sudo rpm -i package.rpm               # Install a .rpm package.

# 10. Universal Linux Packages

tar zxvf source.tar.gz               # Extract a tar.gz file.
cd extracted_source                  # Navigate to the extracted directory.
./configure && make && sudo make install # Compile and install from source.
sudo snap install vlc                # Install VLC via Snap.
sudo snap find spotify               # Find Spotify package in Snap store.
sudo snap list                       # List installed Snap packages.
flatpak install flathub org.gimp.GIMP  # Install GIMP using Flatpak.
flatpak search code                  # Search for VS Code using Flatpak.
flatpak list                         # List installed Flatpak applications.

# 11. Process Related Commands

ps                                 # List all running processes.
pstree                             # Display processes in a tree format.
pmap $$                            # Memory map of the current shell process.
top                                # Display running processes with resource usage.
htop                               # Enhanced version of top with color.
kill 1234                          # Terminate process with PID 1234.
pkill firefox                      # Terminate all Firefox processes.
killall nginx                      # Kill all processes named 'nginx'.
pgrep bash                         # Show the PID of all bash processes.
bg                                 # Resume a job in the background.
fg                                 # Bring a background job to the foreground.
lsof                               # List open files and their associated processes.
trap "echo Signal caught!" SIGINT  # Catch Ctrl+C and run a custom command.
wait                               # Wait for background processes to finish.
nohup long_running_command &       # Run a process in the background, immune to hangups.

# 12. System Management and Information Commands

uname -r                           # Display the current kernel version.
uname -a                           # Display all system information.
uptime                             # Show how long the system has been running.
hostname                           # Show the hostname of the machine.
hostname -i                        # Show the system's IP address.
last reboot                        # List system reboot history.
date                               # Display current date and time.
timedatectl                        # Control and display system clock settings.
cal                                # Display the current month's calendar.
who                                # Show who is logged in.
whoami                             # Display the current logged-in user.
sudo reboot                        # Reboot the system.
sudo shutdown now                  # Shut down the system immediately.
sudo shutdown -r now               # Reboot the system immediately.
sudo shutdown -h +10               # Shut down the system in 10 minutes.
history                            # Show the history of commands used.
watch -n 1 'uptime'                # Run a command repeatedly (every 1 second).
alias ll='ls -lah'                 # Create an alias for listing files in detail.

# 13. Network Commands

ip a                               # Show IP addresses for all interfaces.
ip r                               # Display routing table.
ping google.com                    # Test connectivity to a remote server.
traceroute example.com             # Trace the path packets take to a server.
netstat -tuln                      # Display listening ports and services.
ss -tuln                           # Another way to display listening ports.
sudo ifconfig eth0 down            # Bring the eth0 interface down.
sudo ifconfig eth0 up              # Bring the eth0 interface up.
sudo dhclient eth0                 # Obtain an IP address via DHCP.
wget https://example.com/file.zip  # Download a file from the web.
curl https://example.com           # Fetch a URL's contents.
scp file.txt user@remote:/path     # Securely copy a file to a remote server.
rsync -av /source /dest            # Sync directories, preserving attributes.
ftp ftp.example.com                # Start an FTP session.
ssh user@host                      # Log in to a remote host over SSH.
ssh-copy-id user@host              # Install your public key on a remote server.
iptables -L                        # List the current firewall rules.
firewall-cmd --list-all            # Show all configured firewalld rules.
dig example.com                    # Query DNS information for a domain.
nslookup example.com               # Lookup IP address information for a domain.
mtr example.com                    # Network diagnostic tool combining ping and traceroute.
hostname -I                        # Display all IP addresses assigned to the host.
iwconfig                           # Show wireless network interfaces and their details.
nmcli dev status                   # Show the status of network devices.
systemctl restart NetworkManager   # Restart the network service.

# 14. Disk Usage Commands

df -h                              # Display disk space usage in human-readable format.
du -sh *                           # Summarize disk usage of each file/directory in the current path.
sudo fdisk -l                      # List all partitions and their file systems.
sudo blkid                         # List all block devices with their UUIDs.
mount /dev/sda1 /mnt               # Mount a partition to /mnt.
umount /mnt                        # Unmount the partition at /mnt.
eject /dev/cdrom                   # Eject the CD-ROM or DVD drive.
lsblk                              # List block devices and partitions.
df -i                              # Check inode usage.
tune2fs -l /dev/sda1               # View and modify ext2/ext3/ext4 file system parameters.
mkfs.ext4 /dev/sdb1                # Create an ext4 file system on a partition.
mount -o loop disk.img /mnt        # Mount a disk image as a file system.
fsck /dev/sda1                     # Check and repair a Linux file system.
resize2fs /dev/sda1                # Resize an ext2/ext3/ext4 file system.

# 15. System Monitoring Commands

top                                # Display dynamic view of system processes.
htop                               # Interactive process viewer (similar to top).
iostat                             # Report CPU and I/O statistics.
vmstat                             # Report virtual memory statistics.
mpstat                             # Show CPU usage per processor.
netstat                            # Display network connections and listening ports.
sar                                # System activity report, historical performance data.
uptime                             # Show how long the system has been running.
uptime -p                          # Pretty uptime format.
uptime -s                          # Show the start time of the system.
dstat                              # Versatile resource statistics viewer.
glances                            # Cross-platform monitoring tool.
watch df -h                        # Run a command repeatedly, watching disk usage.

# 16. Miscellaneous Commands

clear                              # Clear the terminal screen.
echo "Hello, World!"               # Print text to the terminal.
man ls                             # Display the manual for the 'ls' command.
apropos 'list files'               # Search for commands related to listing files.
which python3                      # Locate the command binary for python3.
type ls                            # Display the type of a command (e.g., alias, shell built-in).
alias ll='ls -lah'                 # Create an alias for listing files in detail.
history                            # Show command history.
passwd                             # Change the user's password.
uptime                             # Show how long the system has been running.
whoami                             # Print the current user ID and name.
id                                 # Display user and group information.
groups                             # Show groups the current user belongs to.
uname -a                           # Print system information.
uname -r                           # Display kernel release information.
date                               # Show current date and time.
cal                                # Display a simple calendar.
time ls                            # Measure the time a command takes to execute.
sleep 5                            # Wait for 5 seconds.
alias                               # List all current aliases.
unalias ll                         # Remove the alias 'll'.
file example.txt                   # Determine file type of 'example.txt'.
set                                # Set or view shell options and variables.
unset HISTFILE                     # Temporarily disable history recording.
export PATH=$PATH:/custom/bin      # Add /custom/bin to the PATH environment variable.
source ~/.bashrc                   # Reload the bash configuration without logging out.
xargs -n 1 echo                    # Execute a command for each argument from standard input.
chmod +x script.sh                 # Make 'script.sh' executable.
chown user:group file.txt          # Change ownership of 'file.txt'.
find / -name "*.conf"              # Find all .conf files from root directory.
df                                 # Display file system disk space usage.
du                                 # Show disk usage of files and directories.
shutdown now                       # Shut down the system immediately.
reboot                             # Reboot the system.
history                            # Display the command history.
reset                              # Reset the terminal display.
env                                # Display all environment variables.
alias cls='clear'                  # Create an alias for 'clear' command.
set | grep PATH                    # Display only environment variables related to PATH.
export HISTIGNORE="&:[bf]g:exit"   # Ignore specific commands in history.
ulimit -a                          # Display all current limits on system resources.
sosreport                          # Generate a detailed diagnostic report.

# This Bash script provides a comprehensive guide to essential Linux commands, covering various aspects of system management, file manipulation, networking, user management, and more.
