FROM docker.io/ubuntu:24.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y kmod ppp file wget net-tools iproute2

RUN apt-get clean

RUN cd /root && \
    wget https://software.sonicwall.com/NetExtender/NetExtender.Linux-10.2.850.x86_64.tgz && \
    tar -xzf NetExtender.Linux-10.2.850.x86_64.tgz

RUN cd /root/netExtenderClient/ && ./install

CMD ["netExtender"]
