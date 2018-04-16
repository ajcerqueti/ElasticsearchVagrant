#!/usr/bin/env bash

# update apt
sudo apt-get update

# Install HTTPS transport and emacs
sudo apt-get install -y apt-transport-https emacs-nox openjdk-8-jdk

# Install Elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.2.deb
sudo dpkg -i elasticsearch-1.5.2.deb

# For future - get Elasticsearch from repo
# wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
# sudo apt-get update && sudo apt-get install elasticsearch

# Config Elasticsearch
sudo sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/' /etc/elasticsearch/elasticsearch.yml
#sudo sed -i 's/#cluster.name: my-application/cluster.name: renclastic-cluster/' /etc/elasticsearch/elasticsearch.yml
#sudo sed -i 's/#node.name: node-1/node.name: renclastic-node/' /etc/elasticsearch/elasticsearch.yml

sysctl -w vm.max_map_count=262144

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

chmod -R 777 /var/log/elasticsearch
chmod -R 777 /var/lib/elasticsearch
chmod -R 777 /usr/share/elasticsearch
chmod -R 777 /etc/elasticsearch
chmod -R 777 /etc/default/elasticsearch

# Install head
#sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
