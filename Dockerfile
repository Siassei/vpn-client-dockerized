FROM debian:stable-slim
MAINTAINER Thomas Enzinger <info@thomas-enzinger.de>

RUN apt-get update
RUN apt-get -y install bash procps wakeonlan iputils-ping iproute2 iptables
RUN apt-get -y install vpnc openvpn
RUN apt-get -y clean

COPY etc/ /etc/
COPY scripts/ /

ENTRYPOINT ["/entrypoint.sh"]

