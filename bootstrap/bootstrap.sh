#!bin/bash
yum intall -y git

mkdir /data/splunk

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
export PATH=~/.local/bin:$PATH
source ~/.bash_profile

pip install awscli
aws configure set default.region us-east-1
aws configure set aws_access_key_id AKIAISKKJLUWWTQ4OKSA
aws configure set aws_secret_access_key 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

#git clone https://github.com/jmgreg31/terraform.git /data/splunk
aws s3 cp s3://jmgreg31/splunk-6.6.3-e21ee54bc796-linux-2.6-x86_64.rpm /data/splunk
cd /data/splunk
yum install -y splunk-6.6.3-e21ee54bc796-linux-2.6-x86_64.rpm

cd /opt/splunk/bin
./splunk start --accept-license
