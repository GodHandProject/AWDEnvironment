## start mysql
service mysql start

## start ssh
service ssh start

## create database
mysql -uroot -e "create database web"

## change password
mysql -uroot -e "use mysql;UPDATE user SET plugin='mysql_native_password', authentication_string=PASSWORD('root') WHERE User='root';FLUSH PRIVILEGES;"

## start php7.2-fpm
service php7.2-fpm start

## start nginx
nginx -g "daemon off;"