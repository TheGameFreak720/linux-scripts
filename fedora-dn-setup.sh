sudo dnf install GraphicsMagick -y
sudo dnf install python3-pip  -y

#Redis
sudo dnf -y install redis
#Allow Redis to start on boot
sudo systemctl enable redis.service

#PSQL
#https://fedoraproject.org/wiki/PostgreSQL
sudo dnf install postgresql postgresql-server
sudo postgresql-setup initdb
sudo systemctl start postgresql
#Allow postgres to start on boot
sudo systemctl enable postgresql
#Go to wiki for step instructions on setting the environment for Docnetwork. Refer to the distros docs for more info

# After installing this make sure to enable this services to have a smooth experience when restoring a dump
# You can create an extension like this: `CREATE EXTENSION fuzzystrmatch;`

# This is the list:
#     Name      | Version |   Schema   |                     Description                     
#---------------+---------+------------+-----------------------------------------------------
# fuzzystrmatch | 1.1     | public     | determine similarities and distance between strings
# hstore        | 1.6     | public     | data type for storing sets of (key, value) pairs
# plpgsql       | 1.0     | pg_catalog | PL/pgSQL procedural language
# uuid-ossp     | 1.1     | public     | generate universally unique identifiers (UUIDs)

sudo dnf install postgresql-contrib


#Ruby
sudo dnf install ruby -y

#Tmuxinator
sudo gem install tmuxinator

#Papertrail
sudo gem install papertrail

#AWS CLI
sudo  pip3 install awscli

#Python 2
#https://tecadmin.net/install-python-2-7-on-centos-rhel/
sudo dnf install gcc openssl-devel bzip2-devel -
cd /usr/src
sudo wget https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz
sudo tar xzf Python-2.7.16.tgz
cd Python-2.7.16
./configure --enable-optimizations
sudo make altinstall
#Configure npm for Python 2
#https://github.com/nodejs/node-gyp#configuring-python-dependency
npm config set python /usr/local/bin/python2.7

#jq
sudo dnf install jq -y
