# Start with the official NVIDIA CUDA base image for Ubuntu
FROM nvidia/cuda:12.5.0-base-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    software-properties-common && \
    #add-apt-repository ppa:nginx/stable && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && apt-get -y upgrade && \
    apt-get install -y \
    openssl \
    apache2-utils \
    git \
    logrotate \
    memcached \
    nginx \
    nginx-extras \
    php8.3 \
    php8.3-fpm \
    php8.3 \
    php8.3-ctype \
    php8.3-curl \
    php8.3-fileinfo \
    php8.3-fpm \
    php8.3-iconv \
    php8.3-mbstring \
    php8.3-simplexml \
    php8.3-xml \
    php8.3-xmlwriter \
    php8.3-zip \
    php8.3-bcmath \
    php8.3-bz2 \
    php8.3-dom \
    php8.3-exif \
    php8.3-ftp \
    php8.3-gd \
    php8.3-intl \
    php8.3-xmlreader \
    ffmpeg \
    nano \
    wget \
    curl \
    iputils-ping 

# Create a directory for the NGINX logs and configuration
RUN mkdir -p /var/log/nginx && \
    mkdir -p /etc/nginx

# Copy default NGINX configuration
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose the default NGINX port
EXPOSE 80 433
#VOLUME /etc/nginx
# Start NGINX
CMD ["bash", "-c", "service php8.3-fpm start && nginx -g 'daemon off;'"]
