FROM php:7.2-fpm

# Labels
LABEL maintainer="oscar.fanelli@gmail.com"

# Environment variables
ENV PROJECT_PATH=/usr/share/nginx

# Update, upgrade and install extra PHP modules
RUN apt update -q && apt upgrade -yqq && apt install -yqq \
    git \
    libssl-dev \
    zip \
    zlib1g-dev libicu-dev g++ && \
    docker-php-ext-install -j$(nproc) \
        bcmath \
        intl \
        mysqli \
        pdo_mysql

# Composer installer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Workdir
WORKDIR $PROJECT_PATH