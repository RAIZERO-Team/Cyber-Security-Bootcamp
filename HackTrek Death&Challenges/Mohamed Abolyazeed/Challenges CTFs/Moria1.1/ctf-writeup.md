# Moria CTF Writeup

## Overview
This is a detailed writeup for the Moria CTF challenge, which involves exploiting a vulnerable Linux machine with multiple services running.

## Target Information
- Target IP: 192.168.1.10
- Attacker IP: 192.168.1.9

## Reconnaissance

### Port Scanning
Using Nmap (`-p- -sV -sT -sC -O`), the following services were discovered:
- Port 21: FTP (vsftpd 2.0.8 or later)
- Port 22: SSH (OpenSSH 6.6.1)
- Port 80: HTTP (Apache 2.4.6 with PHP 5.4.16)

### System Information
- OS: Linux 3.2 - 4.9
- Machine Type: VMware (MAC: 00:0C:29:AD:B0:37)

## Enumeration

### Web Application (Port 80)
- Title: "Gates of Moria"
- Server: Apache/2.4.6 (CentOS) PHP/5.4.16
- Directory enumeration performed using gobuster/dirbuster
- Default web root: `/var/www/html`

### FTP Service (Port 21)
During FTP enumeration, discovered user "Balrog" with the following password encodings:
- ASCII: `77 101 108 108 111 110 54 57` → "Mellon69"
- Reverse ASCII: `57 54 110 111 108 108 101 77` → "96nolleM"

## Credential Analysis
Found credentials stored in various formats. Here are the username:hash$salt pairs:

```
Balin:c2d8960157fc8540f6d5d66594e165e0$6MAp84
Oin:727a279d913fba677c490102b135e51e$bQkChe
Ori:8c3c3152a5c64ffb683d78efc3520114$HnqeN4
Maeglin:6ba94d6322f53f30aca4f34960203703$e5ad5s
Fundin:c789ec9fae1cd07adfc02930a39486a1$g9Wxv7
Nain:fec21f5c7dcf8e5e54537cfda92df5fe$HCCsxP
Dain:6a113db1fd25c5501ec3a5936d817c29$cC5nTr
Telchar:dd272382909a4f51163c77da6356cc6f$h8spZR
Thrain:7db5040c351237e8332bfbba757a1019$tb9AWe
Balrog:Mellon69
```

### Cracked Passwords
- Balin: flower
- Nain: warrior
- Ori: spanky
- Oin: rainbow
- Dain: abcdef
- Maeglin: fuckoff
- Fundin: hunter2

## Exploitation Process

### Initial Access
1. Used network discovery tools to identify the target
2. Performed comprehensive port scanning
3. Conducted service enumeration on open ports
4. Analyzed web application structure
5. Intercepted and analyzed network traffic using Wireshark

### Password Cracking
- Identified MD5 hashing algorithm being used
- Successfully cracked multiple user passwords
- Used hash format analysis to understand the password storage mechanism

### Privilege Escalation
1. Gained initial SSH access using cracked credentials
2. Successfully elevated privileges to root
3. Changed root password to establish persistence

## Tools Used
1. netdiscover - Network discovery
2. Nmap - Port scanning and service detection
3. FTP client - FTP service enumeration
4. Gobuster/Dirbuster - Web directory enumeration
5. Wireshark - Network traffic analysis
6. SSH client - Remote access

## Conclusion
The Moria CTF challenge was successfully completed by:
1. Identifying and enumerating available services
2. Cracking password hashes
3. Gaining initial access through SSH
4. Achieving root privileges
5. Establishing system control

This machine emphasized the importance of thorough enumeration and password analysis in CTF challenges.

## Recommendations for Defense
1. Update services to latest versions
2. Implement stronger password hashing algorithms
3. Restrict FTP access and implement secure file transfer alternatives
4. Implement proper access controls and privilege separation
5. Regular security patches and updates for the operating system and services
