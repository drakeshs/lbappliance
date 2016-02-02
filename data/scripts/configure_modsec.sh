#!/usr/bin/env bash

# Remove default config
rm -rf /etc/apache2/sites-enabled/000-default.conf
rm -rf /etc/apache2/sites-available/000-default.conf
rm -rf /etc/apache2/sites-available/default-ssl.conf

# Enable mods
a2enmod proxy
a2enmod rpaf
a2enmod proxy_http

git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git /etc/owasp

mkdir -p /etc/modsecurity/rules

mv /etc/owasp/base_rules/modsecurity_35_bad_robots.data /etc/modsecurity/rules/modsecurity_35_bad_robots.data
mv /etc/owasp/base_rules/modsecurity_crs_60_correlation.conf /etc/modsecurity/rules/modsecurity_crs_60_correlation.conf
mv /etc/owasp/base_rules/modsecurity_crs_59_outbound_blocking.conf /etc/modsecurity/rules/modsecurity_crs_59_outbound_blocking.conf
mv /etc/owasp/base_rules/modsecurity_crs_50_outbound.conf /etc/modsecurity/rules/modsecurity_crs_50_outbound.conf
mv etc/owasp/base_rules/modsecurity_crs_49_inbound_blocking.conf /etc/modsecurity/rules/modsecurity_crs_49_inbound_blocking.conf 
mv /etc/owasp/base_rules/modsecurity_crs_47_common_exceptions.conf /etc/modsecurity/rules/modsecurity_crs_47_common_exceptions.conf 
mv /etc/owasp/base_rules/modsecurity_crs_45_trojans.conf /etc/modsecurity/rules/modsecurity_crs_45_trojans.conf 
mv /etc/owasp/base_rules/modsecurity_crs_42_tight_security.conf /etc/modsecurity/rules/modsecurity_crs_42_tight_security.conf 
mv /etc/owasp/base_rules/modsecurity_crs_41_xss_attacks.conf /etc/modsecurity/rules/modsecurity_crs_41_xss_attacks.conf 
mv /etc/owasp/base_rules/modsecurity_crs_41_sql_injection_attacks.conf /etc/modsecurity/rules/modsecurity_crs_41_sql_injection_attacks.conf 
mv /etc/owasp/base_rules/modsecurity_crs_40_generic_attacks.conf /etc/modsecurity/rules/modsecurity_crs_40_generic_attacks.conf 
mv /etc/owasp/base_rules/modsecurity_crs_35_bad_robots.conf /etc/modsecurity/rules/modsecurity_crs_35_bad_robots.conf 
mv /etc/owasp/base_rules/modsecurity_crs_30_http_policy.conf /etc/modsecurity/rules/modsecurity_crs_30_http_policy.conf 
mv /etc/owasp/base_rules/modsecurity_crs_23_request_limits.conf /etc/modsecurity/rules/modsecurity_crs_23_request_limits.conf 
mv /etc/owasp/base_rules/modsecurity_crs_21_protocol_anomalies.conf /etc/modsecurity/rules//modsecurity_crs_21_protocol_anomalies.conf 
mv /etc/owasp/base_rules/modsecurity_crs_20_protocol_violations.conf /etc/modsecurity/rules/modsecurity_crs_20_protocol_violations.conf 
mv /etc/owasp/base_rules/modsecurity_50_outbound_malware.data /etc/modsecurity/rules/modsecurity_50_outbound_malware.data 
mv /etc/owasp/base_rules/modsecurity_50_outbound.data /etc/modsecurity/rules/modsecurity_50_outbound.data
mv /etc/owasp/base_rules/modsecurity_40_generic_attacks.data /etc/modsecurity/rules/modsecurity_40_generic_attacks.data 
mv /etc/owasp/base_rules/modsecurity_35_scanners.data /etc/modsecurity/rules/modsecurity_35_scanners.data