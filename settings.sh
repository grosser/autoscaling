JAVA_HOME="/usr/lib/jvm/java-6-sun/jre"
PATH="`pwd`/as-tools/bin:`pwd`/cf-tools/bin:$PATH"
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
