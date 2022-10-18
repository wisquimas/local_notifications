FROM php:8.0-apache
EXPOSE 80

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

##PERSONALIZADO
RUN addgroup --gid ${GID} --system user
RUN adduser -gid ${GID} --system -disabled-password --shell /bin/sh -u ${UID} user
RUN sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=user/g" /etc/apache2/envvars
RUN sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=user/g" /etc/apache2/envvars

COPY index.php /var/www/html/
COPY start.sh /var/www/html/
RUN mkdir /var/www/html/pipe
RUN mkfifo /var/www/html/pipe_original
RUN chmod -R 777 /var/www/html/pipe
#RUN chown -R www-data:www-data /var/www/html/pipe/
#RUN chown -R www-data:www-data /var/www/html/pipe_original
RUN chmod +x /var/www/html/start.sh
WORKDIR /var/www/html
CMD [ "/var/www/html/start.sh" ]
#ENTRYPOINT ["start.sh"]