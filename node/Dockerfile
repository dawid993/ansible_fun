FROM ubuntu:22.04

# Install SSH server and sudo
RUN apt-get update && \
    apt-get install -y openssh-server sudo rsyslog netcat && \
    mkdir /var/run/sshd && \
    useradd -m ansible && echo 'ansible:ansible' | chpasswd && \
    echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \ 
    echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config && \
    echo "UsePAM no" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["./entrypoint.sh"]

