FROM debian:jessie

RUN apt-get update ; \
    apt-get install -y apache2 php5 libapache2-mod-php5

RUN apt-get install -y php-pear php5-dev tcl-expect-dev && \
    pecl install channel://pecl.php.net/expect-0.3.1 && \
    echo extension=expect.so >> /etc/php5/apache2/php.ini

RUN rm -rf /var/www/html/*
ADD web/* /var/www/html/
ADD secret/* /s3cr3t/

CMD ["apachectl", "-DFOREGROUND"]

EXPOSE 80