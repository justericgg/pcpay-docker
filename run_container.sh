docker run -it \
--add-host api.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-share.pchomepay.com.tw:127.0.0.1 \
--add-host prvtapi.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-test.pchomepay.com.tw:127.0.0.1 \
--add-host mysql.pchomepay.com.tw:10.113.11.217 \
-v ~/Projects/pcpay-api:/var/www/html/pcpay-api \
-v ~/Projects/pcpay-prvtapi:/var/www/html/pcpay-prvtapi \
-v ~/Projects/pcpay-web:/var/www/html/pcpay-web \
-v ~/Projects/pcpay-test:/var/www/html/pcpay-test \
-v ~/log/pcpay-docker/apache2:/var/log/apache2 \
--name pcpay-docker -p 80:80 -d pcpay/pcpay-docker


