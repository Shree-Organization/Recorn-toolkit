# 🕵️ Recon Automation Script

A bash script for automated cybersecurity reconnaissance.  
It integrates multiple tools for **subdomain enumeration, liveness detection, screenshotting, and service scanning**.  

---

## 🚀 Features
- Subdomain enumeration using:
  - [Subfinder](https://github.com/projectdiscovery/subfinder)
  - [Assetfinder](https://github.com/tomnomnom/assetfinder)
  - (Optional) [Amass](https://github.com/owasp-amass/amass)
- Alive subdomain detection using [httprobe](https://github.com/tomnomnom/httprobe)
- Screenshot capture with [Gowitness](https://github.com/sensepost/gowitness)
- Comprehensive service scanning using [Nmap](https://nmap.org/)

---

## 📦 Installation
Make sure you have the following tools installed:

```bash 
sudo apt update && sudo apt upgrade -y
sudo apt install nmap
sudo apt install -y nmap gowitness subfinder assetfinder httprobe
```
--- 

## Clone the repo:
```
git clone https://github.com/yourusername/recon-automation.git
cd recon-automation
chmod +x recon.sh
```
---

## ⚡ Usage
```
./recon.sh example.com
```
---

## Results will be stored in:
```
example.com/
├── subdomains/
│   ├── found.txt
│   └── alive.txt
├── screenshots/
├── scans/
│   └── nmap.txt
```

