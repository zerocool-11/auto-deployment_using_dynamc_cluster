FROM ubuntu

RUN apt update
RUN apt install -y openssh-server
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config 
RUN apt install -y curl
RUN apt install -y sudo
RUN apt install -y openjdk-8-jdk
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv kubectl /usr/local/bin/kubectl
CMD root:root | chpasswd
CMD service ssh start  && /bin/bash
