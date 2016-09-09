FROM debian:latest
MAINTAINER Florian Ammon <@riesenwildschaf>


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apache2 php5

RUN apt-get install -y php-pear php5-dev tcl-expect-dev && \
    pecl install channel://pecl.php.net/expect-0.3.1 && \
    echo extension=expect.so >> /etc/php5/apache2/php.ini

# Copy website
RUN rm -rf /var/www/html/*
ADD web/* /var/www/html/
ADD secret/* /s3cr3t/

# Define default command.
CMD ["apachectl", "-DFOREGROUND"]

# Expose ports.
EXPOSE 80
