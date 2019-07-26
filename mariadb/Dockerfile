FROM mariadb:10.4.6
COPY mariadb.cnf /etc/mysql/conf.d 
COPY utils.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/utils.sh
ENV MYSQL_ROOT_PASSWORD 123456
