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

## 🧑‍💻 Maintainers

Dhruv Bhoir — Creator (Certified Ethical Hacker)

Shree Organization — Repository maintainers

GitHub: https://github.com/Shree-Organization

Email: organizationshree@gmail.com

<p align="center">If this toolkit helps you, please ⭐ star the repo and share responsibly.</p> <p align="center"><sub>Built with ❤️ by Dhruv Bhoir, Mantra Patil &amp; Shree Organization — Stay ethical and safe 🕵️‍♂️</sub></p> ```






