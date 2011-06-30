rm -rf elb-tools
rm -rf ElasticLoadBalancing*
wget http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip
unzip ElasticLoadBalancing.zip
rm -rf ElasticLoadBalancing*.zip
mv ElasticLoadBalancing* elb-tools

rm -rf as-tools
rm -rf AutoScaling*
wget http://ec2-downloads.s3.amazonaws.com/AutoScaling-2010-08-01.zip
unzip AutoScaling*
rm -rf AutoScaling*.zip
mv AutoScaling* as-tools
rm -rf AutoScaling*

rm -rf cw-tools
rm -rf CloudWatch*
wget http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip
unzip CloudWatch*
rm -rf CloudWatch*.zip
mv CloudWatch* cw-tools

rm -rf ec2-api-tools*
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
unzip ec2-api-tools*
rm -rf ec2-api-tools*.zip
mv ec2-api-tools* ec2-tools
