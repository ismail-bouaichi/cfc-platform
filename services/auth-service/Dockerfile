FROM php:8.3-fpm-alpine

# Install system dependencies


# Install PHP extensions
# Added 'sockets' for RabbitMQ
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd sockets

# Install Redis extension via PECL
RUN pecl install redis && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Fix permissions for Laravel storage and cache
# This ensures the container can write logs and session data
RUN chown -R www-data:www-data /var/www

# Use php-fpm instead of artisan serve for better compatibility with your Nginx container
CMD ["php-fpm"]

EXPOSE 9000