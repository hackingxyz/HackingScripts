# autoscan

A simple Bash script to automate a two-stage reconnaissance process against a target host using **Nmap**.  
It is designed for penetration testers and CTF players who want a quick and organized workflow for port scanning and service enumeration.

---

## Features
- **Stage 1**: Full TCP port scan (`-p-`) with `-sS` (SYN scan), optimized with `--min-rate 5000`.
- **Stage 2**: Service and version detection (`-sCV`) against discovered ports.
- Saves scan results into files named with the target IP:
  - `<IP>_portScan` → Greppable output from Stage 1.
  - `<IP>_serviceScan` → Normal output from Stage 2.

---

## Requirements
- **Nmap** installed on your system.
- Root privileges (for SYN scan).

---

## Usage

```bash
chmod +x autoscan
sudo ./autoscan <target-ip>
````

### Example

```bash
sudo ./autoscan 10.10.10.161
```

This will produce:

* `10.10.10.161_portScan`
* `10.10.10.161_serviceScan`

---

## Sample Output

```text
[*] Stage 1 - TCP Port Scan
[*] Open ports found: 22,80,445

[*] Stage 2 - Service and Version Scan
# Nmap 7.93 scan initiated Sun Aug 18 ...
Nmap scan report for 10.10.10.161
PORT    STATE SERVICE VERSION
22/tcp  open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
80/tcp  open  http    Apache httpd 2.4.41 ((Ubuntu))
445/tcp open  smb     Samba smbd 4.6.2
```

---

## Notes

* If the host is filtered by a firewall, you may need to use the Nmap option `-Pn` manually.
* This script focuses on **initial reconnaissance**. You can extend it with further enumeration as needed.

---

## Disclaimer

This script is intended **for educational and authorized penetration testing only**.
The author is not responsible for misuse or illegal activities.
