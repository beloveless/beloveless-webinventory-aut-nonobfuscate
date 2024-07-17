FROM php:8.0-apache

RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        unzip \
        && docker-php-ext-install pdo_mysql mysqli && \
    a2enmod rewrite

WORKDIR /var/www/html

COPY ./web2 ./

EXPOSE 80

CMD ["apache2-foreground"]
