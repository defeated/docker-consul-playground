FROM ubuntu:14.04
MAINTAINER eddie cianci <defeated2k4@gmail.com>

# install common packages
RUN sudo apt-get update -y && \
    sudo apt-get install -y sudo apt-transport-https software-properties-common build-essential bash-completion ca-certificates curl git tmux nano unzip

# download and extract Consul binary
RUN curl -Lo /tmp/consul.zip https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip && \
    mkdir -p /opt/consul/bin/ && \
    cd /opt/consul/bin/ && \
    unzip /tmp/consul.zip && \
    chmod +x consul && \
    ln -s /opt/consul/bin/consul /usr/local/sbin/consul

# download and extract Consul UI
RUN curl -Lo /tmp/consul-ui.zip https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip && \
    mkdir -p /opt/consul-ui/ && \
    cd /opt/consul-ui/ && \
    unzip /tmp/consul-ui.zip

# expose list of ports used by Consul
#
# http://www.consul.io/docs/agent/options.html
#
# Server RPC (Default 8300). This is used by servers to handle incoming requests from other agents. TCP only.
# Serf LAN (Default 8301). This is used to handle gossip in the LAN. Required by all agents. TCP and UDP.
# Serf WAN (Default 8302). This is used by servers to gossip over the WAN to other servers. TCP and UDP.
# CLI RPC (Default 8400). This is used by all agents to handle RPC from the CLI. TCP only.
# HTTP API (Default 8500). This is used by clients to talk to the HTTP API. TCP only.
# DNS Interface (Default 8600). Used to resolve DNS queries. TCP and UDP.
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

# prefix command to run consul subcommands
ENTRYPOINT [ "consul", "agent" ]
