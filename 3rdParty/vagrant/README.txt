Debes modificar tu fichero /etc/hosts añadiendo la siguiente línea

127.0.0.1   www.mycompany.com mycompany.com

Arrancar Vagrant

Desde el directorio installation del repositorio del subversion, ejecuta vagrant up.

Acceder a Vagrant

vagrant ssh

Actualizar datos de vagrant

vagrant destroy
vagrant up

Para acceder, simplemente teclea en tu navegador web

www.mycompany.com:28080



Para desplegar un war en vagrant (si da error de claves borrar la clave antigua de .ssh/known_hosts)
scp -P 2222 target/xxxx.war vagrant@giftstore.amadeus.com:/opt/liferay/deploy

Para copiar sin que pregunte el password
ssh vagrant@localhost (para añadir la nueva clave a .ssh/known_hosts) y luego ya se puede usar
mvn clean package; sshpass -p 'vagrant' scp -P 2222 eCommerce-portlet/target/eCommerce-portlet.war vagrant@giftstore.amadeus.com:/opt/liferay/deploy

Usuario a crear: test@amadeus.com / test
