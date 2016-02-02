# HaProxy and WAF Docker Image

This docker image contains HaProxy 1.6 and Apache2 running Modsecurity. This gives you an out of the box load balancer
and web application firewall.

# Why?
Some people might be asking why. I often find that I have developers who want to test the functionality of the load
balancer on local boxes; this docker image allows me to offer that without needing to teach Ansible etc. It also allows
me to replicate the configuration across multiple instances easily.

# How it works.
The config is a bit convulted, but it basically goes like this:

1.  Traffic is recieved via HaProxy.
2.  HaProxy passes traffic from the intial frontend to a backend running WAF on the localhost
3.  The WAF processes the traffic, and passes it back to a LoadBalancer frontend on a localhost address.
4.  The localhost frontend then directs the traffic to the required backend.


# Usage
This image is designed to make use of Docker Volumes to provide the configuration items. The config items you need to
supply are:

- An HaProxy configuration file
- An Apache configuration file
- A ModSecurity config

See the exampleconfig directory for some examples.


You can start the container using the following command:

`
docker run -d - -v /Users/mduffy/Documents/projects/lbappliance/exampleconfig/waf.conf:/etc/apache2/sites-enabled/waf.conf \
-v /Users/mduffy/Documents/projects/lbappliance/exampleconfig/haproxy.cfg:/etc/haproxy/haproxy.cfg \
-v /Users/mduffy/Documents/projects/lbappliance/exampleconfig/modsecurity.conf:/etc/modsecurity/modsecurity.conf \
stunthamster/lbappliance
`

Note the use of -net=host. This directs Docker to use the underlying host network rather than a bridged network;
essential for the LB to be able to assign interfaces.


## OWASP Rules
By default the image has a fairly good set of rules built in (In my humble opinion). You can over-ride the rules and
config by using the following directory over-ride:

-v <PATH_TO_OWASP_RULES>:/etc/modsecurity/rules

This will then use your own rule set rather than the default.

## SSL Certificates
Don't forget to use a -v option to include any certificates you need, either by directory or individually.
