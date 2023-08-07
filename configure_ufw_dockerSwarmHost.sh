#!/bin/bash

# Reset UFW to default settings, activate this script if you want resset ufw setting first
#ufw --force reset

# Set default policies
ufw default deny incoming
ufw default allow outgoing

# Allow SSH on all interfaces
ufw allow ssh


#ALLOW DOCKER SWARM PORT only on ETH1
# Allow specific ports on eth1
ufw allow in on eth1 to any port 2377 proto tcp
ufw allow in on eth1 to any port 7946 proto tcp
ufw allow in on eth1 to any port 7946 proto udp
ufw allow in on eth1 to any port 4789 proto tcp
ufw allow in on eth1 to any port 4789 proto udp

# Allow specific ports on eth1 for IPv6
ufw allow in on eth1 to any port 2377 proto tcp from ::/0
ufw allow in on eth1 to any port 7946 proto tcp from ::/0
ufw allow in on eth1 to any port 7946 proto udp from ::/0
ufw allow in on eth1 to any port 4789 proto tcp from ::/0
ufw allow in on eth1 to any port 4789 proto udp from ::/0

# Enable UFW
ufw --force enable

# Display UFW status
ufw status verbose
