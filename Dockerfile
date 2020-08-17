FROM ubuntu:16.04


COPY ./sources.list /etc/apt/sources.list
RUN \
        apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
        apt-get update && \
        apt-get install -y mariadb-server mariadb-common && \
        apt-get install -y php-fpm && \
        apt-get install -y nginx && \
        apt-get install -y vim && \
        apt-get install -y php-mysql && \
        apt-get install -y curl && \
        apt-get install -y ssh && \
        useradd ctf -m && \
        echo "ctf:123456" | chpasswd



# 配置nginx
COPY ./default /etc/nginx/sites-available/default

# 添加启动脚本
ADD ./start.sh /start.sh

# 放入自定义www目录
#-------------------------------
COPY ./www /var/www/html
#-------------------------------






RUN chmod 755 /start.sh 

# www目录 非root不可写
RUN chmod 755 -R /var/www/html/ && chown ctf:ctf -R /var/www/html/
RUN mkdir /var/www/html/uploads && chmod 777 -R /var/www/html/uploads/
CMD /start.sh

# Expose ports.
EXPOSE 80
EXPOSE 22
