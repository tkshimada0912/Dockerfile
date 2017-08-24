#!/bin/bash
mkdir -p /etc/letsencrypt/ecdsa/archive
cd /etc/letsencrypt/ecdsa/archive
openssl ecparam -out privkey.pem -name secp384r1 -genkey
cat << '__EOL__' > /tmp/lets_ecdsa
[req]
distinguished_name = dn
[dn]
[SAN]
subjectAltName=DNS:ayurina.net, DNS:blog.ayurina.net, DNS:techblog.ayurina.net
__EOL__
openssl req -new -key privkey.pem -sha256 -nodes -outform der -out csr.der -subj "/CN=ayurina.net" -reqexts SAN -config /tmp/lets_ecdsa
rm /tmp/lets_ecdsa
certbot certonly \
      --csr csr.der \
      --no-self-upgrade \
      -n \
      --webroot \
      --agree-tos \
      --email tk.shimada.0912@gmail.com \
      -w /var/www/html/ayurina.net \
      -d ayurina.net \
      -w /var/www/html/wordpress \
      -d blog.ayurina.net \
      -w /var/www/html/techblog.ayurina.net \
      -d techblog.ayurina.net

mv 0000_cert.pem cert1.pem
mv 0000_chain.pem chain1.pem
mv 0001_chain.pem fullchain1.pem
mv privkey.pem privkey1.pem

mkdir -p /etc/letsencrypt/ecdsa/live
ln -sf /etc/letsencrypt/ecdsa/archive/cert1.pem /etc/letsencrypt/ecdsa/live/cert.pem
ln -sf /etc/letsencrypt/ecdsa/archive/chain1.pem /etc/letsencrypt/ecdsa/live/chain.pem
ln -sf /etc/letsencrypt/ecdsa/archive/fullchain1.pem /etc/letsencrypt/ecdsa/live/fullchain.pem
ln -sf /etc/letsencrypt/ecdsa/archive/privkey1.pem /etc/letsencrypt/ecdsa/live/privkey.pem
