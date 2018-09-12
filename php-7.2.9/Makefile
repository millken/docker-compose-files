dep:
	 sh dep.sh
 
build: 
	 docker build -t millken/php:7.2.9 .
 
 
test: 
	docker run -v /workspace/gitee.com/dnsoa:/var/www/html -p 8811:7000 --rm -it 8806 php /var/www/html/public/whois_swoole_index.php
clean: 
	 rm -rf tmp