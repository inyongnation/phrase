# Gunakan base image Debian untuk Tor
FROM debian:bullseye-slim

# Instal Tor dan web server
RUN apt-get update && \
    apt-get install -y tor apache2 && \
    apt-get clean

# Salin file konfigurasi Tor
COPY torrc /etc/tor/torrc

# Salin file website ke direktori Apache
COPY app /var/www/html

# Jalankan Tor dan Apache
CMD service tor start && apachectl -D FOREGROUND
