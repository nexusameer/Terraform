#!/bin/bash

apt update -y
apt install -y nginx openssl curl

# Get public IP from DigitalOcean metadata
PUBLIC_IP=$(curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/address)

# Create self-signed SSL cert
mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx.key \
  -out /etc/nginx/ssl/nginx.crt \
  -subj "/C=US/ST=NY/L=NYC/O=Example/CN=$PUBLIC_IP"

sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx

# Create custom Nginx config
cat > /etc/nginx/sites-available/default <<EOF
# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name $PUBLIC_IP;

    return 301 https://\$host\$request_uri;
}

# HTTPS server
server {
    listen 443 ssl;
    server_name $PUBLIC_IP;

    ssl_certificate /etc/nginx/ssl/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx.key;

    location / {
        return 200 'Welcome to your Nginx server on $PUBLIC_IP!';
        add_header Content-Type text/plain;
    }
}
EOF



systemctl restart nginx
