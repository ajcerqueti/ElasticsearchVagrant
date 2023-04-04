#!/usr/bin/env bash

# update apt
sudo apt-get update
sudo apt-get -y upgrade

# Install HTTPS transport and emacs
sudo apt-get install -y apt-transport-https emacs-nox openjdk-8-jre-headless

# Install Elasticsearch 1.5.2
#wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.2.deb
#sudo dpkg -i elasticsearch-1.5.2.deb

# For future - get Elasticsearch from repo
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch

# Configure Elasticsearch
#sudo sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/' /etc/elasticsearch/elasticsearch.yml
#sudo sed -i 's/#cluster.name: my-application/cluster.name: renclastic-cluster/' /etc/elasticsearch/elasticsearch.yml
#sudo sed -i 's/#node.name: node-1/node.name: renclastic-node/' /etc/elasticsearch/elasticsearch.yml
sudo cp /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

#sysctl -w vm.max_map_count=262144

# Set permissions
chmod -R 777 /var/log/elasticsearch
chmod -R 777 /var/lib/elasticsearch
chmod -R 777 /usr/share/elasticsearch
chmod -R 777 /etc/elasticsearch
chmod -R 777 /etc/default/elasticsearch

# Set up service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo /bin/systemctl start elasticsearch.service
