yum install java-1.8.0 -y
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-x86_64.rpm
rpm --install elasticsearch-7.15.2-x86_64.rpm
systemctl daemon-reload
systemctl enable elasticsearch
systemctl start elasticsearch
service elasticsearch stop
curl -XGET -H "Content: application/json" "127.0.0.1:9200/_cluster/health?pretty"



