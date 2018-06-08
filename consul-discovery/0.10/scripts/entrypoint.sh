#!/bin/bash

NGINX=/usr/sbin/nginx
NGINX_CONF=/etc/nginx/nginx.conf
NGINX_TEMPLATE=/etc/nginx/nginx.conf.ctmpl
CONSUL_INIT_CONFIG=/config.sh
RESTART=/restart.sh

# Set Consul K/V initial state.
${CONSUL_INIT_CONFIG}

# Nginx default init.
${NGINX} -c ${NGINX_CONF} -t && ${NGINX} -c ${NGINX_CONF} -g "daemon on;"

# Run consul-template.
/usr/local/bin/consul-template \
    -log-level ${LOG_LEVEL:-warn} \
    -consul-addr ${CONSUL_PORT_8500_TCP_ADDR:-consul}:${CONSUL_PORT_8500_TCP_PORT:-8500} \
    -template "${NGINX_TEMPLATE}:${NGINX_CONF}:${RESTART} || true" \