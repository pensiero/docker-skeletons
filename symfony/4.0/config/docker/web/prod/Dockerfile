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

# PHP configs
COPY config/docker/web/prod/php.conf /usr/local/etc/php-fpm.d/zz-log.conf

# Workdir
WORKDIR $PROJECT_PATH

# Move composer and NPM configs before the project copy, in order to improve docker cache
COPY composer.json $PROJECT_PATH/composer.json
COPY composer.lock $PROJECT_PATH/composer.lock

# Composer
RUN composer install --no-interaction --optimize-autoloader

# Copy site into place
COPY . $PROJECT_PATH