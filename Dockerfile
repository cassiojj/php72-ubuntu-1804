### Docker file para container do php72
FROM ubuntu:18.04

LABEL Autor="CJJ < cassio.jjesus@gmail.com >"

#ADD https://s3.amazonaws.com/nido-statics/binary-wkhtmltopdf.tar.gz /usr/local/src/

RUN apt update && apt -y upgrade \
    && apt install -y tzdata \
    && ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && apt install -y php7.2 php7.2-fpm php7.2-common php7.2-xml php7.2-xmlrpc php7.2-mbstring php7.2-mysql php7.2-soap \
       php7.2-opcache php7.2-gd php7.2-zip php7.2-intl php-memcache php-imagick php-pear php7.2-curl php-memcached \
    && apt install -y default-jre openjdk-8-jre-headless \
    && mkdir -p /data/www

COPY confs/www.conf /etc/php/7.2/fpm/pool.d/www.conf
COPY confs/php.ini /etc/php/7.2/fpm/php.ini
COPY confs/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm7.2", "-F"]

##################
### References ###
##################
### To ttimezone
## -> https://blog.codingecho.com/2017/08/01/how-to-change-timezone-on-docker-with-ubuntu-16-04/ (2018-08-31 at 17:00)
### To logs
## -> https://docs.docker.com/config/containers/logging/ (2018-09-03 at 18:09)
## -> https://github.com/nginxinc/docker-nginx/blob/8921999083def7ba43a06fabd5f80e4406651353/mainline/jessie/Dockerfile#L21-L23 (2018-09-03 at 18:09)
