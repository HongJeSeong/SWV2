#!/bin/sh

#Email
#howl78@naver.com
#2019-01-23 patch

sudo apt-get install openjdk-8-jre-headless -y
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
#jenkins
echo "JENKINS INSTALL...###########################################"
sudo apt-get update && apt-get install -y jenkins && echo "###########################################COMPLETE" || echo "###########################################FAIL"
#apapche2
echo "APACHE2 INSTALL...###########################################"
sudo apt-get install -y apache2 && echo "###########################################COMPLETE" || echo "###########################################FAIL"
#apache2 passenger
echo "APACHE2 PASSENGER INSTALL...###########################################"
sudo apt-get install -y libapache2-mod-passenger && echo "###########################################COMPLETE" || echo "###########################################FAIL"
#php mysql redmine redmine mysql
echo "PHP MYSQL REDMINE INSTALL...###########################################"
sudo apt-get install -y php php-mysql mysql-server redmine redmine-mysql ruby-dev && echo "###########################################COMPLETE" || echo "###########################################FAIL"
#gem bundler
echo "GEM BUNDLER INSTALL...###########################################"
gem update
gem install bundler && echo "###########################################COMPLETE" || echo "###########################################FAIL"
touch /usr/share/redmine/Gemfile.lock
chown -R www-data:www-data /usr/share/redmine/ #setting permission
chmod -R 755 /usr/share/redmine/
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod ssl
#tomcat
echo "TOMCAT INSTALL...###########################################"
sudo apt-get install -y libapache2-mod-jk tomcat8 && echo "###########################################COMPLETE" || echo "###########################################FAIL"
#redmine linking
echo "REDMINE LINKING...###########################################"
ln -s /usr/share/redmine/public /var/lib/tomcat8/webapps/ROOT/redmine
#myslq java
echo "MYSQL JAVA INSTALL...###########################################"
sudo apt-get install -y libmysql-java && echo "###########################################COMPLETE" || echo "###########################################FAIL"
ln -s /usr/share/java/mysql-connector-java.jar /usr/share/tomcat8/lib/mysql-connector-java.jar && echo "###########################################COMPLETE" || echo "###########################################FAIL"
#git
echo "GIT INSTALL...###########################################"
sudo apt-get install -y git && echo "###########################################COMPLETE" || echo "###########################################FAIL"
cd /var/lib/tomcat8/webapps
git clone https://github.com/HongJeSeong/SWV2.git
mv SWV2/* ./ROOT/



#configure
echo "CONFIGURING...###########################################"

sed -i 's/JENKINS_ARGS="--webroot=\/var\/cache\/$NAME\/war --httpPort=$HTTP_PORT"/JENKINS_ARGS="--webroot=\/var\/cache\/$NAME\/war --httpPort=$HTTP_PORT --prefix=\/jenkins"/' /etc/default/jenkins

sed -ie 's/PassengerDefaultRuby \/usr\/bin\/ruby/PassengerDefaultRuby \/usr\/bin\/ruby\nPassengerDefaultUser www-data\nPassengerRuby \/usr\/bin\/ruby/' /etc/apache2/mods-available/passenger.conf

sed -ie 's/<\/VirtualHost>/JkMount \/*.jsp tomcat\nJkMount \/*.json tomcat\nJkMount \/*.xml tomcat\nJkMount \/*.do tomcat\nProxyPass \/jenkins http:\/\/127.0.0.1:8080\/jenkins nocanon\nProxyPassReverse \/jenkins http:\/\/127.0.0.1:8080\/jenkins\n<\/VirtualHost>\n<Directory \/var\/lib\/tomcat8\/webapps\/ROOT\/redmine>\nRailsBaseURI \/redmine\nPassengerResolveSymlinksInDocumentRoot on\n<\/Directory>\n<Proxy http:\/\/127.0.0.1:8080.jenkins*>\nOrder deny,allow\nAllow from all\n<\/Proxy>/' /etc/apache2/sites-available/000-default.conf

sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/lib\/tomcat8\/webapps\/ROOT/' /etc/apache2/sites-available/000-default.conf

echo -e "worker.list=tomcat\nworker.tomcat.port=8009\nworker.tomcat.host=localhost\nworker.tomcat.type=ajp13\nworker.tomcat.lbfactor=1" > /etc/apache2/workers.properties
sed -i 's/-e worker.list=tomcat/worker.list=tomcat/' /etc/apache2/workers.properties

sed -i 's/JkWorkersFile \/etc\/libapache2-mod-jk\/workers.properties/JkWorkersFile \/etc\/apache2\/workers.properties/' /etc/apache2/mods-available/jk.conf

echo -e "<Directory /var/lib/tomcat8/webapps/ROOT/>\nOptions FollowSymLinks\nAllowOverride None\nRequire all granted\n</Directory>" >> /etc/apache2/apache2.conf
sed -i 's/-e <Directory/<Directory/' /etc/apache2/apache2.conf

sed -i 's/<Connector port="8080"/<Connector port="8081"/' /etc/tomcat8/server.xml

sed -ie 's/<Engine name="Catalina" defaultHost="localhost">/<Connector port="8009" protocol="AJP\/1.3" redirectPort="8443"\/>\n<Engine name="Catalina" defaultHost="localhost">/' /etc/tomcat8/server.xml

echo "RESTARTING...###########################################"
service apache2 restart
service tomcat8 restart
service jenkins restart
service mysql restart
