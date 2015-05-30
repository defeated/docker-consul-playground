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

# run Consul server
ENTRYPOINT [ "consul" ]
