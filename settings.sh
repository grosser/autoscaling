AWS_AUTO_SCALING_HOME="`pwd`/as-tools"
AWS_CLOUDWATCH_HOME="`pwd`/cw-tools"

JAVA_HOME="/usr/lib/jvm/java-6-sun/jre"
PATH="$AWS_AUTO_SCALING_HOME/bin:$AWS_CLOUDWATCH_HOME/bin:$PATH" # TODO only do this once...

AWS_CREDENTIAL_FILE="`pwd`/credentials"
ZONE="eu-west-1a" # <=== Availability Zone
REGION="eu-west-1"
SECURITY_GROUP="my-sg"
INSTANCE_SIZE="t1.micro" # <=== Instance Type (micro, small, Large, ...)
LB_NAME="my-lb"
LC_NAME="my-lc"
LC_IMAGE_ID="ami-xxxx"
SG_NAME="my-sg"
KEY_PAIR="my-key"
