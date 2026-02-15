FROM ubuntu:22.04

# Install SSH server and sudo
RUN apt-get update && apt-get install -y openssh-server sudo && apt-get install -y rsyslog && \
    apt-get install -y netcat

# Create SSH directory
RUN mkdir /var/run/sshd

# Create user 'ansible' with password 'ansible'
RUN useradd -m ansible && echo 'ansible:ansible' | chpasswd

# Add 'ansible' user to sudoers with no password prompt
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Allow password authentication and disable root login
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config  

RUN echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config && \
    echo "UsePAM no" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["./entrypoint.sh"]

