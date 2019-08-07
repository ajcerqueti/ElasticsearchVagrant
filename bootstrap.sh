#!/usr/bin/env bash

# update apt
sudo apt-get update
sudo apt-get upgrade

# install java
sudo apt-get install openjdk-8-jre-headless -y

# install elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.2.deb
sudo dpkg -i elasticsearch-1.5.2.deb
sudo update-rc.d elasticsearch defaults 95 10
sudo service elasticsearch start

# install head
sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
