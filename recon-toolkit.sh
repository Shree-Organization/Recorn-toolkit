#!/bin/bash
# ============================================
# 🔎 Advanced Recon Automation Script
# Author: Shree Organization / CodeM03
# Description: Automated subdomain discovery, probing, and scanning
# Tools: subfinder, assetfinder, httprobe, gowitness (optional), nmap
# ============================================

# --- Colors ---
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RESET="\033[0m"

# --- Input Validation ---
domain=$1
if [ -z "$domain" ]; then
  echo -e "${RED}[!] Usage: $0 <domain>${RESET}"
  echo -e "${YELLOW}Example: ./recon.sh example.com${RESET}"
  exit 1
fi

# --- Timestamp for organized runs ---
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# --- Directory Structure ---
base_dir="${domain}_${timestamp}"
subdomain_dir="$base_dir/subdomains"
screenshot_dir="$base_dir/screenshots"
scan_dir="$base_dir/scans"
log_dir="$base_dir/logs"

mkdir -p "$subdomain_dir" "$screenshot_dir" "$scan_dir" "$log_dir"

# --- Logging ---
log_file="$log_dir/recon.log"
touch "$log_file"

# --- Helper function ---
log() {
  echo -e "${GREEN}[$(date +"%H:%M:%S")] $1${RESET}"
  echo "[$(date +"%H:%M:%S")] $1" >> "$log_file"
}

error_exit() {
  echo -e "${RED}[!] $1${RESET}"
  echo "[!] $1" >> "$log_file"
  exit 1
}

# --- Check Dependencies ---
required_tools=("subfinder" "assetfinder" "httprobe" "nmap")
optional_tools=("gowitness")

log "Checking required tools..."
for tool in "${required_tools[@]}"; do
  if ! command -v $tool &>/dev/null; then
    error_exit "Missing tool: $tool. Please install it before running."
  fi
done

log "All required tools found."

# --- Subdomain Enumeration ---
log "🔹 Launching Subfinder..."
subfinder -d "$domain" -silent | sort -u > "$subdomain_dir/found.txt" || log "Subfinder failed."

log "🔹 Launching Assetfinder..."
assetfinder --subs-only "$domain" | sort -u >> "$subdomain_dir/found.txt" || log "Assetfinder failed."

# Uncomment if Amass is available
# log "🔹 Launching Amass..."
# amass enum -d "$domain" >> "$subdomain_dir/found.txt"

# --- Unique & Cleaned Subdomains ---
cat "$subdomain_dir/found.txt" | grep "$domain" | sort -u > "$subdomain_dir/all_subdomains.txt"
count=$(wc -l < "$subdomain_dir/all_subdomains.txt")
log "✅ Total subdomains found: $count"

# --- Alive Subdomains ---
log "🌐 Checking for alive subdomains..."
cat "$subdomain_dir/all_subdomains.txt" | httprobe -prefer-https | grep https | sed 's/https\?:\/\///' | sort -u > "$subdomain_dir/alive.txt"

alive_count=$(wc -l < "$subdomain_dir/alive.txt")
log "✅ Alive subdomains: $alive_count"

# --- Screenshots (optional) ---
if command -v gowitness &>/dev/null; then
  log "📸 Capturing screenshots with Gowitness..."
  gowitness file -f "$subdomain_dir/alive.txt" -P "$screenshot_dir/" --no-http || log "Gowitness failed."
else
  log "⚠️ Gowitness not installed — skipping screenshots."
fi

# --- Nmap Scan ---
log "🧨 Running Nmap on alive subdomains..."
nmap -iL "$subdomain_dir/alive.txt" -T4 -A -p- -oN "$scan_dir/nmap.txt" \
  && log "✅ Nmap scan completed. Results saved in $scan_dir/nmap.txt" \
  || log "⚠️ Nmap scan failed."

# --- Summary ---
log "----------------------------------------"
log "Recon Completed Successfully!"
log "Results:"
log " - Subdomains: $subdomain_dir/all_subdomains.txt"
log " - Alive: $subdomain_dir/alive.txt"
log " - Screenshots: $screenshot_dir/"
log " - Scans: $scan_dir/nmap.txt"
log " - Logs: $log_file"
log "----------------------------------------"

echo -e "${BLUE}🎯 Recon completed for ${YELLOW}$domain${RESET}"
