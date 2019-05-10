FROM alpine

MAINTAINER Mindy Cong "mindycong@gmail.com"

ENV FRP_VERSION 0.27.0

RUN set -ex \
    && cd /tmp \
    && wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && rm frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && cd frp_${FRP_VERSION}_linux_amd64 \
    && cp frps /usr/local/bin \
    && cp frpc /usr/local/bin \
    && mkdir /frp \
    && cp frps.ini /frp \
    && cp frpc.ini /frp \
    && cd .. \
    && rm -rf frp_${FRP_VERSION}_linux_amd64

VOLUME ["/frp"]

CMD ["frps", "-c", "/frp/frps.ini"]
