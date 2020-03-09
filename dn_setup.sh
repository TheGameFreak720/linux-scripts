sudo dnf install GraphicsMagick -y
sudo dnf install python3-pip  -y

# Redis
sudo dnf -y install redis

# Allow Redis to start on boot
sudo systemctl enable redis.service

# PSQL
sudo dnf install postgresql postgresql-server
sudo postgresql-setup initdb
sudo systemctl start postgresql

# Allow postgres to start on boot
sudo systemctl enable postgresql

USER_NAME=$USER
sudo su - postgres
psql -c "CREATE USER $USER_NAME WITH SUPERUSER CREATEDB CREATEROLE REPLICATION;"
sudo su - $USER_NAME

#Ruby
sudo dnf install ruby -y

#Tmuxinator
sudo gem install tmuxinator

#Papertrail
sudo gem install papertrail

#AWS CLI
sudo  pip3 install awscli

