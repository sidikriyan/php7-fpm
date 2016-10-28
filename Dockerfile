FROM php:7.0-fpm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        libmemcached-dev \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev
		
# Install PHP mcrypt extention
RUN docker-php-ext-install mcrypt

# Install PHP pdo_mysql extention
RUN docker-php-ext-install pdo_mysql

# Install PHP pdo_pgsql extention
RUN docker-php-ext-install pdo_pgsql

# Install the PHP gd library
RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd