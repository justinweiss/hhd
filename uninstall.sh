#!/usr/bin/bash
# Removes handheld daemon from ~/.local/share/hhd

if [ "$EUID" -eq 0 ]
  then echo "You should run this script as your user, not root (sudo)."
  exit
fi

# Disable Service
sudo systemctl disable hhd_local@$(whoami)
sudo systemctl stop hhd_local@$(whoami)

# Remove Binary
rm -rf ~/.local/share/hhd

# Remove /etc files
sudo rm -f /etc/udev/rules.d/83-hhd.rules
sudo rm -f /etc/systemd/system/hhd_local@.service

# # Delete your configuration
# rm -rf ~/.config/hhd

echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!! Do not forget to re-enable HandyGCCS/Handycon if your device relies on it. !!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Handheld Daemon Uninstalled. Reboot!"