sh "$1.settings.sh"

### Read current value
elb-describe-lbs --region $REGION
elb-describe-instance-health $LB_NAME --region $REGION
as-describe-launch-configs $LC_NAME --region $REGION
as-describe-auto-scaling-groups $SG_NAME --region $REGION
mon-describe-alarms --region $REGION

### Install

# Set up load balancer
elb-create-lb $LB_NAME --headers --listener "lb-port=80,instance-port=$LB_INSTANCE_PORT,protocol=http" --availability-zones $ZONE

#Setup Load Balancer Health Check
elb-configure-healthcheck $LB_NAME --headers --target "HTTP:80/" --interval 5 --timeout 2 --unhealthy-threshold 2 --healthy-threshold 2 --region $REGION

# Setup instance launch config
as-create-launch-config $LC_NAME --image-id $LC_IMAGE_ID --instance-type $INSTANCE_SIZE --group $SECURITY_GROUP --region $REGION  --key $KEY_PAIR

#Setup Auto Scaling Group
as-create-auto-scaling-group $SG_NAME --availability-zones $ZONE --launch-configuration $LC_NAME --min-size 1 --max-size 6 --load-balancers $LB_NAME --show-xml --region $REGION

# Setup Scaling Policies (to add instance)
SCALE_UP_POLICY=`as-put-scaling-policy MyScaleUpPolicy1 --auto-scaling-group $SG_NAME --adjustment=1 --type ChangeInCapacity --cooldown 300 --region $REGION`

#Setup Alarm (Add instance when CPU Load is more then 70%)
mon-put-metric-alarm MyHighCPUAlarm1 --comparison-operator GreaterThanThreshold --evaluation-periods 1 --metric-name CPUUtilization --namespace "AWS/EC2" --period 60 --statistic Average --threshold 70 --alarm-actions $SCALE_UP_POLICY --dimensions "AutoScalingGroupName=$SG_NAME" --region $REGION

# Setup Scaling Policies (to reduce instance)
SCALE_DOWN_POLICY=`as-put-scaling-policy MyScaleDownPolicy1 --auto-scaling-group $SG_NAME --adjustment=-1 --type ChangeInCapacity --cooldown 300 --region $REGION`

#Setup Alarm (Reduce instance when CPU Load is less then 30%)
mon-put-metric-alarm MyLowCPUAlarm1 --comparison-operator LessThanThreshold --evaluation-periods 1 --metric-name CPUUtilization --namespace "AWS/EC2" --period 60 --statistic Average --threshold 30 --alarm-actions $SCALE_DOWN_POLICY --dimensions "AutoScalingGroupName=$SG_NAME" --region $REGION



### Delete everything:
# as-update-auto-scaling-group $SG_NAME --min-size 0 --max-size 0 --region $REGION

# -> terminate all instances in aws console

# as-delete-launch-config $LC_NAME --region $REGION -f
# as-delete-auto-scaling-group $SG_NAME --region $REGION -f
