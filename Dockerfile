FROM wordpress:6.6.1-php8.2-apache
ENV WORDPRESS_DB_HOST=mysql:3306 \
    WORDPRESS_DB_USER=abuser \
    WORDPRESS_DB_PASSWORD=word0pass \
    WORDPRESS_DB_NAME=wordpress
EXPOSE 80
CMD ["apache2-foreground"]
