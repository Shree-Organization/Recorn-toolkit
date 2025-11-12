<h1 align="center">🕵️ Recon Toolkit</h1>

<p align="center">
  <b>Automated reconnaissance pipeline for subdomain enumeration, liveness checks, screenshotting and service scanning</b><br>
  Created by <strong>Dhruv Bhoir</strong> — Certified Ethical Hacker & Penetration Tester
</p>

<p align="center">
  <a href="https://github.com/Shree-Organization/Recorn-toolkit/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/Shree-Organization/Recorn-toolkit/ci.yml?label=CI%2FCD&logo=github" alt="CI/CD" />
  </a>
  <img src="https://img.shields.io/badge/Bash-4.0%2B-blue.svg" alt="Bash" />
  <img src="https://img.shields.io/badge/Tools-Subfinder%2C+Nmap%2C+Gowitness-orange.svg" alt="Tools" />
  <a href="https://github.com/Shree-Organization/Recorn-toolkit/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT" />
  </a>
  <p align="center">
  <a href="https://www.gnu.org/software/bash/"><img src="https://img.shields.io/badge/Shell-Bash-blue?style=for-the-badge&logo=gnu-bash"></a>
  <img src="https://img.shields.io/badge/Level-Advanced-critical?style=for-the-badge">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge">
</p>

  <br><br>
  <a href="https://github.com/Shree-Organization/Recorn-toolkit/stargazers">
    <img src="https://img.shields.io/github/stars/Shree-Organization/Recorn-toolkit?style=social" alt="GitHub stars" />
  </a>
  <a href="https://github.com/Shree-Organization/Recorn-toolkit/network/members">
    <img src="https://img.shields.io/github/forks/Shree-Organization/Recorn-toolkit?style=social" alt="GitHub forks" />
  </a>
</p>


---

> **Automate common reconnaissance tasks** in a single script. Designed to streamline subdomain enumeration → alive-check → screenshot → port/service scan workflows for authorized security testing.

> ⚠️ **AUTHORIZED USE ONLY** — do not run this against targets without explicit permission.

> ⚠️ **For educational and authorized testing only.**  
> Do **NOT** scan or probe systems without explicit permission.

---

## 🚀 Features

- 🔎 **Subdomain enumeration** using multiple sources:
  - `subfinder` (fast, passive + some active sources)
  - `assetfinder`
  - (optional) `amass` for deep enumeration
- ✅ **Alive detection** using `httprobe`
- 📸 **Screenshotting** of live hosts with `gowitness`
- 🔍 **Service/port scanning** with `nmap`
- 🧩 Clean output folder structure per target for easy analysis

---

## 📦 Requirements

Install the following tools (example for Debian/Ubuntu):

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y nmap
# Install other tools via their recommended installers:
# subfinder, assetfinder, httprobe, gowitness (see links below)
```


---

## ⚙️ Installation

### 1️⃣ Clone the repository
```bash
git clone https://github.com/Shree-Organization/Recon-Automation-Tool.git
cd Recon-Automation-Tool
```
### 2️⃣ Make it executable
```
chmod +x recon.sh
```

### 3️⃣ Ensure the required tools are installed

| Tool                       | Purpose               | Install Command                                                               |
| -------------------------- | --------------------- | ----------------------------------------------------------------------------- |
| **subfinder**              | Subdomain enumeration | `go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest` |
| **assetfinder**            | Asset discovery       | `go install github.com/tomnomnom/assetfinder@latest`                          |
| **httprobe**               | Check for live hosts  | `go install github.com/tomnomnom/httprobe@latest`                             |
| **gowitness** *(optional)* | Capture screenshots   | `go install github.com/sensepost/gowitness@latest`                            |
| **nmap**                   | Network scanning      | `sudo apt install nmap -y`                                                    |

Make sure $GOPATH/bin is in your PATH:
```bash 
export PATH=$PATH:$(go env GOPATH)/bin
```

## 🧩 Usage

#### Basic Command
```
./recon.sh example.com
```
#### Output Example
```
[+] Launching Subfinder...
[+] Launching Assetfinder...
[+] Finding Alive Subdomains...
[+] Running Nmap on alive Subdomains...
✅ Recon Completed Successfully!
```


Example Run Summary
```yaml
----------------------------------------
Recon Completed Successfully!
Results:
 - Subdomains: subdomains/all_subdomains.txt
 - Alive: subdomains/alive.txt
 - Screenshots: screenshots/
 - Scans: scans/nmap.txt
 - Logs: logs/recon.log
----------------------------------------
🎯 Recon completed for example.com
```

## 🧰 Tool Workflow
```
      ┌─────────────┐
      │   DOMAIN    │
      └──────┬──────┘
             │
             ▼
   ┌───────────────────────────┐
   │  Subfinder / Assetfinder  │
   └─────────┬─────────────────┘
             │
             ▼
       ┌─────────────┐
       │   httprobe  │
       └─────┬───────┘
             │
             ▼
   ┌────────────────────┐
   │  gowitness (opt.)  │
   └─────────┬──────────┘
             │
             ▼
          ┌──────┐
          │ nmap │
          └──────┘
```

## 🧠 Future Enhancements
- Add httpx and waybackurls for richer data
- Integrate masscan for faster port scanning
- Add JSON / HTML summary reports
- Parallel execution for faster recon
- Web dashboard for result visualization


## 🛡 Disclaimer
This tool is intended for educational and authorized security testing.
The authors are not responsible for any misuse or damage caused by this tool.




## 🧑‍💻 Maintainers

- Dhruv Bhoir — Creator (Certified Ethical Hacker)
- Shree Organization — Repository maintainers
- GitHub: https://github.com/Shree-Organization
- Email: organizationshree@gmail.com


<h3 align="center"></h3> <p align="center"> <br><br> <img src="https://img.shields.io/badge/Keep%20Learning-Ethical%20Hacking-orange?style=for-the-badge&logo=gnu-bash"> <img src="https://img.shields.io/badge/Open%20Source-Contributions%20Welcome-blue?style=for-the-badge&logo=github"> </p>



<p align="center">If this toolkit helps you, please ⭐ star the repo and share responsibly.</p> <p align="center"><sub>Built with ❤️ by Dhruv Bhoir, Mantra Patil &amp; Shree Organization — Stay ethical and safe 🕵️‍♂️</sub></p> 




