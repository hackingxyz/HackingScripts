#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No color

# Validate IP argument
if [ -z "$1" ]; then
    echo -e "${RED}[!] You must provide an IP address as argument. Example: sudo ./recon 10.10.10.161${NC}"
    exit 1
fi
IP="$1"

# ------------------ Stage 1 ------------------
echo -e "${GREEN}[*]${NC} ${YELLOW}Stage 1 - TCP Port Scan${NC}"
sudo nmap -p- --open -sS --min-rate 5000 -vvv -n "$IP" -oG "${IP}_portScan" > /dev/null

if ! grep -q "Status: Up" "${IP}_portScan"; then
    echo -e "${RED}[!] The host seems to be down. Maybe you need to use -Pn?${NC}"
    exit 1
fi

# Extract open ports
PORTS=$(grep -oP '\d+/open' "${IP}_portScan" | cut -d/ -f1 | paste -sd, -)

if [ -z "$PORTS" ]; then
    echo -e "${RED}[!] No open ports found. Aborting.${NC}"
    exit 1
fi

echo -e "${GREEN}[*]${NC} Open ports found: $PORTS"

# ------------------ Stage 2 ------------------
echo -e "${GREEN}[*]${NC} ${YELLOW}Stage 2 - Service and Version Scan${NC}"
sudo nmap -p "$PORTS" -sCV "$IP" -oN "${IP}_serviceScan"
