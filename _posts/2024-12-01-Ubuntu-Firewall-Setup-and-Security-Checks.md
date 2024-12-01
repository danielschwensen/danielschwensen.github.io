---
layout: post
title: "Ubuntu Firewall Setup and Security Checks"
date: 2024-12-01
categories: blog linux
tags: Linux Ubuntu firewall security
---
Basic commands and steps for securing Ubuntu using UFW firewall, setting up automated security updates, and implementing daily security checks with log rotation. 

# 1. Check Firewall Status

```
sudo ufw status

sudo ufw status verbose

sudo ufw status numbered
```

# 2. Install and Enable UFW


```
# Check if installed
dpkg -l | grep ufw
# or

which ufw

# Install if needed
sudo apt update
sudo apt install ufw

# Enable firewall
sudo ufw enable
```

# 3. Basic UFW Configuration

```
# Default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Common services
sudo ufw allow ssh        # Port 22
sudo ufw allow 80/tcp     # HTTP
sudo ufw allow 443/tcp    # HTTPS
```

# 4. System Security Check Commands

```
# Check open ports
sudo ss -tulpn

# Check login attempts
sudo last
sudo grep "Failed password" /var/log/auth.log

# Check sudo usage
sudo grep "sudo" /var/log/auth.log
```

# 5. Enable Automatic Security Updates

```
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

# 6. Daily Security Check Script


Create a script in `/etc/cron.daily/security-check` that:
- Monitors failed login attempts
- Checks network connections
- Tracks system resources
- Rotates logs (keeps last 10 backups)
- Creates daily reports in `/var/log/security-check.log`

# Notes:


- Default Ubuntu installation doesn't enable UFW by default
- Basic system is secure even without UFW if no services are installed
- Monitor auth.log for suspicious activities
- GUI configuration available through GUFW: `sudo apt install gufw`
![GUFW]({{ "/assets/2024/gufw.png" | absolute_url }})
- Regularly check system logs
- Keep system updated: `sudo apt update && sudo apt upgrade`
- Monitor open ports and running services