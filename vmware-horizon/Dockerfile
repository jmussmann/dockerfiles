FROM debian:stretch

ARG URL=https://download3.vmware.com/software/view/viewclients/CART21FQ3/VMware-Horizon-Client-5.5.0-16946361.x64.bundle
ARG UID=1000
ARG GID=1000

RUN apt update && \
    apt install --yes --no-install-recommends \
        binutils \
        ca-certificates \
        curl \
        freerdp-x11 \
        libatk1.0-dev \
        libatk-bridge2.0-dev \
        libgdk-pixbuf2.0-dev \
        libgtk2.0-dev \
        libgtk-3.0 \
        libengine-pkcs11-openssl \
        libpkcs11-helper1-dev \
        libudev-dev \
        libusb-dev \
        libxtst-dev \
        libxss-dev \
        libpng-dev \
        lsb-release \
        grep \
        python \
        rdesktop \
        sed \
        tar \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create User
RUN groupadd -g ${GID} vmwareuser && useradd -u ${UID} -g ${GID} -ms /bin/bash vmwareuser

RUN wget -O VMware-Horizon-Client.bundle $URL && \
    chmod +x VMware-Horizon-Client.bundle && \
    env TERM=dumb VMWARE_EULAS_AGREED=yes ./VMware-Horizon-Client.bundle --console --required && \
    rm ./VMware-Horizon-Client.bundle

# Fix libudev symlink (VMware expects an older version, different path)
RUN ln -sf /lib/x86_64-linux-gnu/libudev.so.1.6.5 /lib/x86_64-linux-gnu/libudev.so.0

# See here for more options:
# https://docs.vmware.com/en/VMware-Horizon-Client-for-Linux/5.5/horizon-client-linux-installation/GUID-AB6F0B4D-03DD-4E7A-AE16-BAB77CE4D42D.html
# Anything specified in the mandatory config cannot be overridden by the end user. Useful for enforcing that they can only connect to SSL verified servers.
RUN mkdir -p /etc/vmware/
COPY view-mandatory-config /etc/vmware/
COPY view-default-config /etc/vmware/
RUN chmod 0444 /etc/vmware/view-mandatory-config
RUN chmod 0644 /etc/vmware/view-default-config
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

WORKDIR /home/vmwareuser

CMD /usr/local/bin/docker-entrypoint.sh
