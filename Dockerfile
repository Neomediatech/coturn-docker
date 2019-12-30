FROM neomediatech/ubuntu-base

ENV VERSION=4.5.0.7 \
    SERVICE=coturn \
    OS=ubuntu \
    DEBIAN_FRONTEND=noninteractive 

LABEL maintainer="docker-dario@neomediatech.it" \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-type=Git \
      org.label-schema.vcs-url=https://github.com/Neomediatech/$SERVICE \
      org.label-schema.maintainer=Neomediatech

# Copy the current directory contents into the container at /app
COPY entrypoint.sh /

EXPOSE 3478

RUN apt-get update && apt-get install -y dnsutils coturn iproute2 openssl && \
    chmod +x /entrypoint.sh && \
    rm -rf /var/lib/apt/lists/*
  
ENTRYPOINT ["bash", "entrypoint.sh"]
