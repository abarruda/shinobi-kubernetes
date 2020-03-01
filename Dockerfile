FROM ubuntu

RUN apt-get update && apt-get install -y curl sudo git

RUN ["/bin/bash", "-c", "{ echo 'N'; echo '1'; } | bash <(curl -s https://gitlab.com/Shinobi-Systems/Shinobi-Installer/raw/master/shinobi-install.sh)"]

VOLUME /var/lib/mysql

WORKDIR /home/Shinobi

CMD chown mysql:mysql /var/lib/mysql && mysql_install_db && service mysql start && { echo "source sql/framework.sql;"; echo "source sql/user.sql;"; } | mysql && ./INSTALL/start.sh
