#!/bin/bash

CURRENT_DIR=$(pwd)

# update initial OS version
echo -e "\n\n****** Running initial yum update ******\n\n"
yum update -y

echo "EC2USER_HOME = ${EC2USER_HOME}"
echo "ECACHE_EP = ${ECACHE_EP}"
echo "RDS_EP = ${RDS_EP}"

# setup .pgpass file
echo -e "\n\n****** Setting up .pgpass file ******\n\n"
echo "*:*:*:postgres:postgres" > ${EC2USER_HOME}/.pgpass
chown ec2-user ${EC2USER_HOME}/.pgpass
chmod 600 ${EC2USER_HOME}/.pgpass
ls -al ${EC2USER_HOME}/.pgpass
cat ${EC2USER_HOME}/.pgpass

echo "*:*:*:postgres:postgres" > ~root/.pgpass
chmod 600 ~root/.pgpass
ls -al ~root/.pgpass
cat ~root/.pgpass

# setup production.env file
echo -e "\n\n****** Setting up production.env file ******\n\n"
cat << EOT >> ${EC2USER_HOME}/production.env
#
POSTGRES_HOST=${RDS_EP}
POSTGRES_PORT=5432
POSTGRES_DB_NAME=hello
POSTGRES_USER=postgres
POSTGRES_AUTH=postgres
#
REDIS_HOST=${ECACHE_EP}
REDIS_PORT=6379
EOT
chown ec2-user ${EC2USER_HOME}/production.env
chmod 600 ${EC2USER_HOME}/production.env
ls -al ${EC2USER_HOME}/production.env
cat ${EC2USER_HOME}/production.env

# install and start docker/docker service
echo -e "\n\n****** Installing docker packages and staring service ******\n\n"
amazon-linux-extras install -y docker
usermod -a -G docker ec2-user
systemctl start docker

# install and configure docker-compose
echo -e "\n\n****** Installing and configuring docker-compose ******\n\n"
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | tee /usr/local/bin/docker-compose > /dev/null
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# install redis-stable
# echo -e "\n\n****** Installing redis-stable ******\n\n"
# yum install -y gcc
# yum install -y wget
# wget http://download.redis.io/redis-stable.tar.gz
# tar xvzf redis-stable.tar.gz
# cd redis-stable
# make
# rm -rf redis-stable.tar.gz redis-stable.tar.gz.1
# cd $CURRENT_DIR
# echo "PATH=$PATH:~/redis-stable/src" >> ${EC2USER_HOME}/.bashrc
# source ${EC2USER_HOME}/.bashrc

# install postgresql
echo -e "\n\n****** Installing postgresql ******\n\n"
yum install -y postgresql

# create database, table, and data
psql --host=${RDS_EP} --port=5432 --username=postgres -c 'CREATE DATABASE hello;'
psql --host=${RDS_EP} --port=5432 --username=postgres --dbname=hello -c 'CREATE TABLE users (id SERIAL PRIMARY KEY, name varchar, address varchar, phone varchar);'
psql --host=${RDS_EP} --port=5432 --username=postgres --dbname=hello -c "INSERT INTO users(name, address, phone) VALUES ('Teresa', '1234 W Main Street', '123-456-7890');"
psql --host=${RDS_EP} --port=5432 --username=postgres --dbname=hello -c "INSERT INTO users(name, address, phone) VALUES ('Dave', '1234 W Main Street', '123-456-7891');"

# pull docker image
echo -e "\n\n****** Pulling docker image for hello-python ******\n\n"
docker pull davidwnorrisjr/hello-python:latest

# startup docker instances with docker compose
echo -e "\n\n****** Bringing up docker-compose ******\n\n"
docker-compose up --force-recreate --build -d
