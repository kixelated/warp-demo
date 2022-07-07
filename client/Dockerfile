FROM ubuntu

# Install dependencies
RUN apt-get update && apt-get install -y nginx certbot python3-certbot-nginx

# Contains the final certificates created by certbot
VOLUME /etc/letsencrypt

# Application configuration for our site
COPY nginx/quic.video.conf /etc/nginx/conf.d/quic.video.conf

# The script to init and run nginx
COPY nginx/run.sh /run/warp-client

# Copy over the web contents
COPY dist/* /var/www/quic.video

# Run the shell script
CMD /run/warp-client
