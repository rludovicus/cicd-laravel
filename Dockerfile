FROM '123majumundur/php-7.1-nginx:cicd'
MAINTAINER Rivaldo <rivaldoludovicus20@gmail.com>

RUN composer global require hirak/prestissimo

RUN mkdir /home/app/app
WORKDIR /home/app/app

COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app.composer

COPY --chown=app:root . ./

RUN composer dump-autoload --no-scripts --no-dev --optimize

EXPOSE 8080