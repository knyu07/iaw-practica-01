# INSTALACIÓN DE AWSTATS (NO ME FUNCIONA)
AWS_IP=52.87.204.228 
apt-get install awstats libgeo-ipfree-perl libnet-ip-perl -y
cp /etc/awstats/awstats.conf /etc/awstats/awstats.$AWS_IP.conf
sed -i 's/LogFormat=4/LogFormat=1/' /etc/awstats/awstats.$AWS_IP.conf
sed -i 's/SiteDomain=""/SiteDomain=52.87.204.228/' /etc/awstats/awstats.$AWS_IP.conf
sed -i 's/HostAliases="localhost 127.0.0.1"/HostAliases="localhost 127.0.0.1 52.87.204.228"/' /etc/awstats/awstats.$AWS_IP.conf
sed -i 's/AllowFullYearView=2/AllowFullYearView=3/' /etc/awstats/awstats.$AWS_IP.conf
sed -i 's/AllowAccessFromWebToFollowingIPAddresses=""/AllowAccessFromWebToFollowingIPAddresses="127.0.0.1 0.0.0.0-255.255.255.255"/' /etc/awstats/awstats.$AWS_IP.conf
sudo mv /etc/cron.d/awstats/root
sudo rm /var/lib/awstats/*
chgrp www-data /var/log/apache2/var/log/apache2/* log /var/log/apache2/access.log
sudo chmod 755 /var/log/apache2
sudo chmod 644 /var/log/apache2/*
sed -i 's/create 640 root adm/create 640 root www-data/' /etc/logrotate.d/apache2
sudo echo 'Alias ​​/awstatsclasses"/usr/share/awstats/lib/"' >> /etc/apache2/sites-available/000-default.conf
sudo echo 'Alias ​​/awstats-icon/"/usr/share/awstats/icon/"' >> /etc/apache2/sites-available/000-default.conf
sudo echo 'Alias ​​/awstatscss"/usr/share/doc/awstats/examples/css"' >> /etc/apache2/sites-available/000-default.conf
sudo echo 'ScriptAlias ​​/cgi-bin/ /usr/lib/cgi-bin/' >> /etc/apache2/sites-available/000-default.conf
sudo echo 'ScriptAlias ​​/awstats/ /usr/lib/cgi-bin/' >> /etc/apache2/sites-available/000-default.conf
sudo echo 'Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch' >> /etc/apache2/sites-available/000-default.conf
sudo a2enmod cgi
sudo systemctl restart apache2 
