docker run -it \
--add-host api.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-share.pchomepay.com.tw:127.0.0.1 \
--add-host prvtapi.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-test.pchomepay.com.tw:127.0.0.1 \
--add-host mysql.pchomepay.com.tw:10.113.11.217 \
-v /<workspace>/pcpay-api:/var/www/html/pcpay-api \
-v /<workspace>/pcpay-prvtapi:/var/www/html/pcpay-prvtapi \
-v /<workspace>/pcpay-web:/var/www/html/pcpay-web \
-v /<workspace>/pcpay-test:/var/www/html/pcpay-test \
--name pcpay-docker -p 80:80 -p 443:443 -d pcpay/pcpay-docker


