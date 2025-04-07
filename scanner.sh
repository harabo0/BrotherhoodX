#!/bin/bash
clear
cat banner.txt

echo ""
echo "Scanning APK File : $1"
echo "------------------------------------"

if [ -z "$1" ]; then
  echo "Usage: ./scanner.sh target.apk"
  exit 1
fi

echo "[*] Checking APK info..."
aapt dump badging "$1" 2>/dev/null || echo "Error reading APK info."

echo ""
echo "[*] Checking for common errors..."
unzip -t "$1" 2>/dev/null || echo "Failed to unzip or invalid APK."

echo ""
echo "[*] Searching for vulnerabilities keywords..."
unzip -p "$1" 2>/dev/null | strings | grep -Ei "key|password|secret|vuln|debug|admin" || echo "Nothing Suspicious Found."

echo ""
echo "------------------------------------"
echo "Scan Completed!"
echo ""
echo "Brotherhood forever | GPT x HARAB06"
