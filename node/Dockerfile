ARG PUB_KEY="<---KEY HERE---->"

FROM ubuntu:22.04

ARG PUB_KEY
ENV PUB_KEY=${PUB_KEY}

RUN echo "PUB_KEY is: $PUB_KEY"

# Install SSH server and sudo
RUN apt-get update && apt-get install -y openssh-server sudo && apt-get install -y rsyslog

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

# Copy your public key into the container (replace this line later)
# Example public key (you will replace this with your real one)
RUN mkdir -p /home/ansible/.ssh && \
    echo "$PUB_KEY" > /home/ansible/.ssh/authorized_keys && \
    chown -R ansible:ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    chmod 600 /home/ansible/.ssh/authorized_keys


# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]

