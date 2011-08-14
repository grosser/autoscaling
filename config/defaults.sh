# ! Do not add custom settings here !

# give me a config folder as first argument e.g. config/myproject
BASE_DIR=$(readlink -f $1)

# script home dirs
export AWS_AUTO_SCALING_HOME="`pwd`/tools/as"
export AWS_CLOUDWATCH_HOME="`pwd`/tools/cw"
export AWS_ELB_HOME="`pwd`/tools/elb"
export EC2_HOME="`pwd`/tools/ec2"

# only needed for ec2-tools
export EC2_PRIVATE_KEY="$BASE_DIR/ec2.pk.pem"
export EC2_CERT="$BASE_DIR/ec2.cert.pem"


#set environment for linux or mac
if [ -f "/usr/lib/jvm/java-6-sun/jre" ]; then
  export JAVA_HOME="/usr/lib/jvm/java-6-sun/jre"
else
  export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
fi

export AWS_CREDENTIAL_FILE="$BASE_DIR/credentials"

# temporarily add each bin folders to PATH
PATH="$EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_CLOUDWATCH_HOME/bin:$AWS_ELB_HOME/bin:$PATH" # TODO only do this once...

# Some sane defaults
SECURITY_GROUP="default"
LB_INSTANCE_PORT=80
MIN_INSTANCES=1
SCALE_UP_ADJUSTMENT=1
