# Use the official PHP image from Docker Hub (PHP 8.0)
FROM php:8.0-fpm

# Set working directory inside the container
WORKDIR /var/www

# Install system dependencies and PHP extensions needed by Laravel
RUN apt-get update && apt-get install -y libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql bcmath mbstring \
    && apt-get clean

# Copy the Laravel project files into the container
COPY . .

# Install Composer (PHP dependency manager)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP dependencies (Run Composer)
RUN composer install --no-dev --optimize-autoloader

# Set permissions for storage and cache directories
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose port 80 to access the app via HTTP
EXPOSE 80

# Run Laravel's artisan serve command when the container starts
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]
