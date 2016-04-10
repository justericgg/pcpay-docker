docker run -it \
--add-host pcpay-share.pchomepay.com.tw:127.0.0.1 \
--add-host prvtapi.pchomepay.com.tw:127.0.0.1 \
--add-host mysql.pchomepay.com.tw:10.113.11.217 \
-v /Users/justericgg/Projects/pcpay-api:/var/www/html/pcpay-api \
-v /Users/justericgg/Projects/pcpay-prvtapi:/var/www/html/pcpay-prvtapi \
-v /Users/justericgg/Projects/pcpay-web:/var/www/html/pcpay-web \
--name pcpay-docker -p 80:80 -p 443:443 -d pcpay/pcpay-docker


