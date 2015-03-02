echo "Instalando MySQL y apache2"
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password Passw0rd'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password Passw0rd'
#sudo apt-get update
sudo apt-get -y install mysql-server-5.5 apache2 unzip sshpass

#Instalando jdk7
if [ ! -f /opt/jdk1.7 ];
then
	echo "Obteniendo JDK7..."
	cd /tmp
#    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz"
	echo "Ejecutando JDK7..."
	cd /opt
	#tar -zxvf /vagrant/jdk-7u71-linux-x64.tar.gz
    	tar -zxvf /tmp/jdk-7u71-linux-x64.tar.gz

    	ln -s /opt/jdk1.7.0_71 jdk1.7
	
	touch /etc/profile.d/vagrant.sh
	echo "export JAVA_HOME=/opt/jdk1.7" >> /etc/profile.d/vagrant.sh
	echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile.d/vagrant.sh

fi

echo "Configurando las bbdd de liferay"
if [ ! -f /var/log/databasesetup ];
then
    echo "Creando bbdd para mycompany"
    echo "create database mycompany default character set utf8" | mysql -uroot -pPassw0rd
    echo "grant all privileges on mycompany.* to mycompany@'localhost' identified by 'Passw0rd'" | mysql -uroot -pPassw0rd
    echo "grant all privileges on mycompany.* to mycompany@'%' identified by 'Passw0rd'" | mysql -uroot -pPassw0rd
    echo "flush privileges" | mysql -uroot -pPassw0rd
	
	touch /var/log/databasesetup
fi

echo "Desempaquetando el tomcat de liferay"
if [ ! -f /opt/liferay ];
then
	cd /opt
	unzip /mnt/liferay-portal-tomcat-6.2-ce-ga3-20150103155803016.zip
	mv /opt/liferay-portal-6.2-ce-ga3 liferay
fi

echo "Configurando portal-ext.properties y el datasource"
if [ ! -f /etc/init.d/liferay.sh ];
then
	cp /mnt/dev.portal-ext.properties /opt/liferay/tomcat-7.0.42/webapps/ROOT/WEB-INF/classes/portal-ext.properties
	cp /mnt/context.xml /opt/liferay/tomcat-7.0.42/conf/context.xml
	cp /mnt/undeploy-ext.sh /opt/liferay/undeploy-ext.sh

	echo "Estableciendo usuario vagrant como propietario del tomcat"
	chown -R vagrant.vagrant /opt/liferay

	echo "Instalando script de arranque"
	cp /mnt/liferay.sh /etc/init.d
	chmod a+x /etc/init.d/liferay.sh
	update-rc.d liferay.sh defaults
fi



