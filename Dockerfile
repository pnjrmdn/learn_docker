FROM php:7.4-apache

# Install ekstensi PHP yang dibutuhkan
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Salin file konfigurasi Apache ke dalam container
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Aktifkan mod_rewrite untuk URL rewriting
RUN a2enmod rewrite

# Restart Apache
RUN service apache2 restart

# Salin kode PHP Anda ke dalam direktori web server
COPY src/ /var/www/html/

