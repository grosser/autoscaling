source config/defaults.sh `$(dirname $0)`

# Enter your AMI ID here
# this is Ubuntu 10.04 with EBS on eu-west
# e.g. http://uec-images.ubuntu.com/releases/10.04/release/
LC_IMAGE_ID="ami-5c417128"

INSTANCE_SIZE="t1.micro" # Instance Type (micro, small, Large, ...)

ZONE="eu-west-1a" # Availability Zone
REGION="eu-west-1"
SECURITY_GROUP="default"
KEY_PAIR="my-autoscaling"

LB_NAME="my-autoscaling"
LC_NAME="my-autoscaling-lc"
SG_NAME="my-autoscaling-sg"

LB_INSTANCE_PORT=80

# scale policy
LB_INSTANCE_PORT=80
MIN_INSTANCES=1
MAX_INSTANCES=5
SCALE_UP_ADJUSTMENT=1
