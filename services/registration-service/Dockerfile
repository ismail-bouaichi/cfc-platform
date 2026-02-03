FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install essential PHP extensions only
RUN docker-php-ext-install pdo_pgsql bcmath sockets

# Install Redis extension
RUN pecl install redis && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Fix permissions
RUN chown -R www-data:www-data /var/www

CMD ["php-fpm"]

EXPOSE 9000