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
sudo ./autoscan 127.0.0.1
```
![autoscan example](https://github.com/hackingxyz/autoscan/blob/main/1.png?raw=true)

This will produce:

* `127.0.0.1_portScan`
* `127.0.0.1_serviceScan`

![autoscan example](https://github.com/hackingxyz/autoscan/blob/main/2.png?raw=true)

---

## Notes

* If the host is filtered by a firewall, you may need to use the Nmap option `-Pn` manually.
* This script focuses on **initial reconnaissance**. You can extend it with further enumeration as needed.

---

## Disclaimer

This script is intended **for educational and authorized penetration testing only**.
The author is not responsible for misuse or illegal activities.
