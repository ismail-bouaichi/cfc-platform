FROM php:8.3-fpm-alpine

# Install system dependencies


# Install PHP extensions
# 'sockets' and 'bcmath' are critical for RabbitMQ communication
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd sockets

# Install Redis for caching formation data
RUN pecl install redis && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Permissions for Alpine
RUN chown -R www-data:www-data /var/www

# Production-ready PHP-FPM
CMD ["php-fpm"]

EXPOSE 9000