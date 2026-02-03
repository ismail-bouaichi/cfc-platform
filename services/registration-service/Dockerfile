FROM php:8.3-fpm-alpine

# Install system dependencies


# Install PHP extensions
# Sockets and BCMath are essential for RabbitMQ (inter-service communication)
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd sockets

# Install Redis for distributed locking (prevents double-registration)
RUN pecl install redis && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Fix permissions for Alpine environment
RUN chown -R www-data:www-data /var/www

# Use php-fpm for high-performance microservice communication
CMD ["php-fpm"]

EXPOSE 9000