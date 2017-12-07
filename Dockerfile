FROM php:7-apache
MAINTAINER Shane Burkhart <shaneburkhart@gmail.com>

RUN apt-get update -y && apt-get install -y libpng-dev

COPY . /var/www/html/
RUN chown -R www-data /var/www/html/*

RUN a2enmod rewrite

RUN docker-php-ext-install zip
RUN docker-php-ext-install gd

RUN bin/gpm selfupgrade -f
RUN bin/gpm install admin

EXPOSE 80
