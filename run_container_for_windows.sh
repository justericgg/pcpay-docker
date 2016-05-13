docker run -it \
--add-host api.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-share.pchomepay.com.tw:127.0.0.1 \
--add-host prvtapi.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-secure.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-member.pchomepay.com.tw:127.0.0.1 \
--add-host pcpay-test.pchomepay.com.tw:127.0.0.1 \
--add-host mysql.pchomepay.com.tw:10.113.11.217 \
--add-host mcache.pchomepay.com.tw:10.113.11.217 \
--add-host gearman.pchomepay.com.tw:10.113.11.217 \
-v /c/Users/jamesyu/workspace/pcpay-api:/var/www/html/pcpay-api \
-v /c/Users/jamesyu/workspace/pcpay-prvtapi:/var/www/html/pcpay-prvtapi \
-v /c/Users/jamesyu/workspace/pcpay-web:/var/www/html/pcpay-web \
-v /c/Users/jamesyu/workspace/pcpay-test:/var/www/html/pcpay-test \
-v /c/Users/jamesyu/workspace/log:/var/log/apache2 \
--name pcpay-docker -p 80:80 -p 443:443 -p 9000:9000 -d pcpay/pcpay-docker