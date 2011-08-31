source config/defaults.sh config/example

# Enter your AMI ID here
# this is Ubuntu 10.04 with EBS on eu-west
# e.g. http://uec-images.ubuntu.com/releases/10.04/release/
export LC_IMAGE_ID="ami-5c417128"

export INSTANCE_SIZE="t1.micro" # Instance Type (micro, small, Large, ...)

export ZONE="eu-west-1a" # Availability Zone
export REGION="eu-west-1"
export SECURITY_GROUP="default"
export KEY_PAIR="my-autoscaling"

export LB_NAME="my-autoscaling"
export LC_NAME="my-autoscaling-lc"
export SG_NAME="my-autoscaling-sg"

export LB_INSTANCE_PORT=80

# scale policy
export LB_INSTANCE_PORT=80
export MIN_INSTANCES=1
export MAX_INSTANCES=5
export SCALE_UP_ADJUSTMENT=1
