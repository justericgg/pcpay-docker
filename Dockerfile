FROM ubuntu:trusty

MAINTAINER Eric G. Huang <eric.g.yuan@gmail.com>

# Install packages
RUN apt-get update && \
	apt-get -y install supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-xdebug php5-curl php5-dev libpcre3-dev gcc make openssl && \
  	echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN /bin/echo 'extension=curl.so' > /etc/php5/mods-available/curl.ini
RUN /usr/sbin/php5enmod mcrypt

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

RUN /bin/echo 'extension=phalcon.so' > /etc/php5/mods-available/phalcon.ini
RUN /usr/sbin/php5enmod phalcon

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
ADD pcpay-api.conf /etc/apache2/sites-available/pcpay-api.conf
ADD pcpay-prvtapi.conf /etc/apache2/sites-available/pcpay-prvtapi.conf
ADD pcpay-secure.conf /etc/apache2/sites-available/pcpay-secure.conf
ADD pcpay-member.conf /etc/apache2/sites-available/pcpay-member.conf
ADD pcpay-share.conf /etc/apache2/sites-available/pcpay-share.conf
ADD pcpay-test.conf /etc/apache2/sites-available/pcpay-test.conf

RUN a2ensite pcpay-api.conf && \
	a2ensite pcpay-prvtapi.conf && \
	a2ensite pcpay-secure.conf && \
	a2ensite pcpay-member.conf && \
	a2ensite pcpay-share.conf && \
	a2ensite pcpay-test.conf

RUN a2enmod rewrite && \
	a2enmod proxy && \
	a2enmod proxy_http && \
	a2enmod proxy_ajp && \
	a2enmod deflate && \
	a2enmod headers && \
	a2enmod proxy_balancer && \
	a2enmod proxy_connect && \
	a2enmod proxy_html && \
	a2enmod ssl

WORKDIR /

VOLUME ["/var/www/html/pcpay-api", "/var/www/html/pcpay-prvtapi", "/var/www/html/pcpay-web", "/var/www/html/pcpay-test", "/var/log/apache2"]

EXPOSE 80 443

CMD ["/run.sh"]
