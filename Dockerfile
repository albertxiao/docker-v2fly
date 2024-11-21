FROM --platform=${TARGETPLATFORM} ubuntu:latest
LABEL maintainer="V2Fly Community <dev@v2fly.org>"

WORKDIR /tmp
ARG TARGETPLATFORM
ARG TAG
COPY v2ray.sh "${WORKDIR}"/v2ray.sh

RUN apt-get update && apt-get install ca-certificates -y
RUN mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
    && chmod +x "${WORKDIR}"/v2ray.sh \
    && "${WORKDIR}"/v2ray.sh

ENTRYPOINT ["/usr/bin/v2ray"]
