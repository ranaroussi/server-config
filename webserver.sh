export DEBIAN_FRONTEND=noninteractive
export NODE_VERSION=18
export PHP_VERSION=8.3

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
nvm install $NODE_VERSION && \

add-apt-repository -y ppa:ondrej/php && \
apt update -yq && apt upgrade -yq && \
apt install -yq \
  nginx \
  nginx-extras \
  mariadb-server \
  redis-server \
  memcached \
  postfix \
  apache2-utils \
  gnuplot \
  supervisor \
  imagemagick \
  php$PHP_VERSION \
  php$PHP_VERSION-bcmath \
  php$PHP_VERSION-bz2 \
  php$PHP_VERSION-cgi \
  php$PHP_VERSION-curl \
  php$PHP_VERSION-dba \
  php$PHP_VERSION-dev \
  php$PHP_VERSION-dom \
  php$PHP_VERSION-enchant \
  php$PHP_VERSION-fpm \
  php$PHP_VERSION-gd \
  php$PHP_VERSION-gmp \
  php$PHP_VERSION-imap \
  php$PHP_VERSION-intl \
  php$PHP_VERSION-ldap \
  php$PHP_VERSION-mbstring \
  php$PHP_VERSION-mysqli \
  php$PHP_VERSION-odbc \
  php$PHP_VERSION-pgsql \
  php$PHP_VERSION-phpdbg \
  php$PHP_VERSION-pspell \
  php$PHP_VERSION-snmp \
  php$PHP_VERSION-soap \
  php$PHP_VERSION-sqlite3 \
  php$PHP_VERSION-tidy \
  php$PHP_VERSION-xsl \
  php$PHP_VERSION-zip \
  php$PHP_VERSION-memcached \
  php$PHP_VERSION-imagick \
apt remove libnginx-mod-http-perl -y && \
apt-mark manual libnginx-mod-http-geoip2 && \
apt autoremove -y && apt autoclean -y && \
addgroup webmasters && usermod -a -G webmasters www-data && \
mkdir /root/public_html && \
mkdir -p /root/public_html/vhost.com/{backup,log,public} && \
chown -R root:webmasters /root/public_html && \
chmod -R g+w /root/public_html && \
find /root/public_html -type d -exec chmod g+s {} \; && \
echo -e "\e[31mFINISHED :)\e[0m\n" && \
echo -e "* To install mcrypt for PHP, run: pecl install mcrypt-1.0.2" && \
echo -e "* To secure your MySQL, run: mysql_secure_installation\n" && \
echo -e "Lastly, refer to the webconfig repository for nginx/php configuration"
