#!/bin/bash
set -euxo pipefail

# Try to generate a certificate that expires in 90 days.
# This will listen on port 80 and serve a challenge file, proving we own the domain.
certbot --nginx --email kixelated@gmail.com -d quic.video --agree-tos

# The certbot nginx plugin will automatically append the certs to the configuration.
nginx
