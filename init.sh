export DEBIAN_FRONTEND=noninteractive && \
export TZ=Europe/London && \
source .bash_profile && \
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original && \
mv sshd_config /etc/ssh/sshd_config && \
sed -i -E 's/^Port .*/Port '$SSHPORT'/' /etc/ssh/sshd_config && \
echo $HOSTNAME > /etc/hostname && \
service sshd restart && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt remove -y docker docker.io && \
add-apt-repository -y universe && \
apt update --allow-unauthenticated -yq && apt upgrade -yq && \
apt install -yq \
    software-properties-common \
    build-essential \
    apt-transport-https \
    ca-certificates \
    docker.io \
    autoconf \
    bash-completion \
    curl \
    wget \
    gcc \
    gettext \
    git \
    htop \
    libcurl4-gnutls-dev \
    libev-dev \
    libevdev2 \
    libexpat1-dev \
    libmcrypt-dev \
    libpcre3 \
    libpcre3-dev \
    libssl-dev \
    make \
    mc \
    mosh \
    pkg-config \
    screenfetch \
    libc6-dev \
    zlib1g-dev \
    whois \
    postgresql-client-common postgresql-client pgcli && \
update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
apt install -y python3-pip python3-pip && \
    pip3 install --upgrade pip && \
systemctl enable docker && \
dpkg --purge apache2 && \
    apt purge apache2 && \
    apt remove apache2 && \
    rm -f /etc/init.d/apache2 && \
    rm -Rf /var/www && \
apt autoremove -y && apt autoclean -y && \
sed -i '1s;^;GRUB_HIDDEN_TIMEOUT=5\nGRUB_HIDDEN_TIMEOUT_QUIET=false\n;' /etc/default/grub && update-grub && \
echo -e "\n\e[31mFINISHED :)\e[0m" && \
echo -e "* To install new user, run: bash user.sh" && \
echo -e "* To install web environment, run: bash webserver.sh\n" && \
echo -e "* To finish installation, please reboot yout system."
