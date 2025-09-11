#!/bin/bash

domain=$1
RED="\033[1;31m"
RESET="\033[0M"

subdomain_path=$domain/subdomains
screenshot_path=$domain/screenshots
scan_path=$domain/scans

if [ ! -d "$domain" ];then
        mkdir $domain
fi        
if [ ! -d "$subdomain_path" ];then
        mkdir $subdomain_path  
fi                      
if [ ! -d "$screenshot_path" ];then
        mkdir $screenshot_path
fi        
if [ ! -d "$scan_path" ];then
        mkdir $scan_path
fi        
        
echo -e "${RED} [+] Launcing Subfinder ... ${RESET}" 
subfinder -d $domain > $subdomain_path/found.txt

echo -e "${RED} [+] Launcing Assetfinder ... ${RESET}" 
assetfinder $domain | grep $domain >> $subdomain_path/found.txt

#echo -e "${RED} [+] Launcing Amass ... ${RESET}" 
#amass enum -d $domain >> $subdomain_path/found.txt

echo -e "${RED} [+] Finding Alive Subdomains ... ${RESET}" 
cat $subdomain_path/found.txt | grep $domain | sort -u | httprobe -prefer-https | grep https | sed 's/https\?:\/\///' | tee -a $subdomain_path/alive.txt 

#echo -e "${RED} [+] Taking Screenshot Of alive Subdomains ... ${RESET}" 
#gowitness file -f $subdomain_path/alive.txt -P $screenshot_path/ --no-http

echo -e "${RED} [+] Running Nmap on alive Subdomains ... ${RESET}" 
nmap -iL $subdomain_path/alive.txt -T4 -A -p- -oN $scan_path/nmap.txt 



