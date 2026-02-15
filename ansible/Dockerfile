FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ansible openssh-client python3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]