FROM ubuntu:trusty

MAINTAINER Eric G. Huang <eric.g.yuan@gmail.com>

# Install packages
RUN apt-get update && \
	apt-get -y install supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-xdebug php5-dev libpcre3-dev gcc make && \
  	echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf

#install phalcon
WORKDIR /tmp
RUN /usr/bin/git clone https://github.com/phalcon/cphalcon.git && \
    cd cphalcon/build/ && \
    ./install && \
    cd /tmp && \
    /bin/rm -rf /tmp/cphalcon/

RUN /bin/echo 'extension=phalcon.so' >/etc/php5/mods-available/phalcon.ini
RUN /usr/sbin/php5enmod phalcon

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN chmod 755 /*.sh
WORKDIR /

EXPOSE 80
CMD ["/run.sh"]