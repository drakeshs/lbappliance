#!/usr/bin/env bash

# Remove default config
rm -rf /etc/apache2/sites-enabled/000-default.conf
rm -rf /etc/apache2/sites-available/000-default.conf
rm -rf /etc/apache2/sites-available/default-ssl.conf

# Enable mods
a2enmod proxy
a2enmod rpaf
a2enmod proxy_http

mkdir /etc/owasp
cd /etc/owasp
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git

cd owasp-modsecurity-crs
