docker run -it \
--add-host api.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-share.pchomepay.com.tw:127.0.0.1 \
--add-host prvtapi.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-secure.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-member.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-test.pchomepay.com.tw:127.0.0.1 \
--add-host mysql.pchomepay.com.tw:10.113.11.217 \
--add-host mcache.pchomepay.com.tw:10.113.22.190 \
--add-host gearman.pchomepay.com.tw:10.113.11.217 \
--add-host pgmail.pchomepay.com.tw:10.113.11.221 \
-v ~/Projects/pcpay-api:/var/www/html/pcpay-api \
-v ~/Projects/pcpay-prvtapi:/var/www/html/pcpay-prvtapi \
-v ~/Projects/pcpay-web:/var/www/html/pcpay-web \
-v ~/Projects/pcpay-test:/var/www/html/pcpay-test \
-v ~/log/pcpay-docker/apache2:/var/log/apache2 \
--name pcpay-docker -p 80:80 -p 443:443 -p 9000:9000 -d pcpay/pcpay-docker


