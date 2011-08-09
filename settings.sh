# stuff amazon script needs
export AWS_AUTO_SCALING_HOME="`pwd`/as-tools"
export AWS_CLOUDWATCH_HOME="`pwd`/cw-tools"
export AWS_ELB_HOME="`pwd`/elb-tools"
export EC2_HOME="`pwd`/ec2-tools"

# only needed for ec2-tools
export EC2_PRIVATE_KEY="`pwd`/xxx.pk.pem" # downloadable when X.509 certificate is created
export EC2_CERT="`pwd`/xxx.cert.pem"

#set environment for linux or mac
if [ -f /usr/lib/jvm/java-6-sun/jre ]; then
  export JAVA_HOME="/usr/lib/jvm/java-6-sun/jre"
else
  export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
fi

export AWS_CREDENTIAL_FILE="`pwd`/credentials"

# temporarily add bin folders to PATH
PATH="$EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_CLOUDWATCH_HOME/bin:$AWS_ELB_HOME/bin:$PATH" # TODO only do this once...

# set you custom stuff
ZONE="eu-west-1a" # <=== Availability Zone
REGION="eu-west-1"
SECURITY_GROUP="my-sg"
INSTANCE_SIZE="t1.micro" # <=== Instance Type (micro, small, Large, ...)
LB_NAME="my-lb"
LC_NAME="my-lc"
LC_IMAGE_ID="ami-xxxx"
SG_NAME="my-sg"
KEY_PAIR="my-key"
$LB_INSTANCE_PORT
