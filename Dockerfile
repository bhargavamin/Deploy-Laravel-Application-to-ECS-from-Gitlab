FROM php:7.4-fpm-alpine

# Install packages
RUN apk update && apk add -u apache2 php7-apache2 php7-mbstring php7-session php7-json php7-pdo php7-openssl php7-tokenizer php7-pdo php7-pdo_mysql php7-xml php7-simplexml \
    && ln -s /usr/sbin/httpd /usr/sbin/apache2
RUN apk add --no-cache bash coreutils grep sed

# Install app
RUN rm -rf /var/www/localhost/* && mkdir -p /var/www/html
ADD laravel-app /var/www/html

# Upload and replace apache2 config file
RUN rm -rf /etc/apache2/httpd.conf
COPY httpd.conf_default /etc/apache2/httpd.conf

# Configure apache
RUN chown -R www-data:www-data /var/www/html
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
