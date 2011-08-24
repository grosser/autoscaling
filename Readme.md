A small script to get started with aws autoscaling, inspired by [Tehrani](http://mtehrani30.blogspot.com/2011/05/amazon-auto-scaling.html)

The default setup is:

 - Load Balancer (with N-Instances)
 - Autoscaling Group (with N-instances + 1 Launch Config)
 - Launch Config (used to configure new instances)
 - Scale-Up policy (e.g. add 5 servers when Autoscaling Group CPU-load is above 70%)
 - Scale-Down policy (e.g. remove 1 server when Autoscaling Group CPU-load is below 30%)

Setup
=====

    git clone git://github.com/grosser/autoscaling.git
    cd autoscaling
    sh download_tools.sh
    cp -R config/example config/yourproject

Customize the copied credentials and settings.

If you want to use ec2-tools, also add:

 - config/yourproject/ec2.cert.pem
 - config/yourproject/ec2.pk.pem

Usage
=====

    source config/yourproject/settings.sh

### Basic
    # Create a Load Balancer
    elb-create-lb $LB_NAME --headers --listener "lb-port=80,instance-port=$LB_INSTANCE_PORT,protocol=http" --availability-zones $ZONE

    # Create a Launch-Config
    as-create-launch-config $LC_NAME --image-id $LC_IMAGE_ID --instance-type $INSTANCE_SIZE --group $SECURITY_GROUP --region $REGION  --key $KEY_PAIR

    #Setup Auto Scaling Group
    as-create-auto-scaling-group $SG_NAME --availability-zones $ZONE --launch-configuration $LC_NAME --min-size $MIN_INSTANCES --max-size $MAX_INSTANCES --load-balancers $LB_NAME --show-xml --region $REGION

    # Automatically add new instances when CPU Load is above then 70%
    SCALE_UP_POLICY=`as-put-scaling-policy MyScaleUpPolicy1 --auto-scaling-group $SG_NAME --adjustment=$SCALE_UP_ADJUSTMENT --type ChangeInCapacity --cooldown 300 --region $REGION`
    mon-put-metric-alarm MyHighCPUAlarm1 --comparison-operator GreaterThanThreshold --evaluation-periods 1 --metric-name CPUUtilization --namespace "AWS/EC2" --period 60 --statistic Average --threshold 70 --alarm-actions $SCALE_UP_POLICY --dimensions "AutoScalingGroupName=$SG_NAME" --region $REGION

    # Automatically remove instances when CPU Load is less then 30%
    SCALE_DOWN_POLICY=`as-put-scaling-policy MyScaleDownPolicy1 --auto-scaling-group $SG_NAME --adjustment=-1 --type ChangeInCapacity --cooldown 300 --region $REGION`
    mon-put-metric-alarm MyLowCPUAlarm1 --comparison-operator LessThanThreshold --evaluation-periods 1 --metric-name CPUUtilization --namespace "AWS/EC2" --period 60 --statistic Average --threshold 30 --alarm-actions $SCALE_DOWN_POLICY --dimensions "AutoScalingGroupName=$SG_NAME" --region $REGION

### Status

    elb-describe-lbs --region $REGION
    elb-describe-instance-health $LB_NAME --region $REGION

    as-describe-launch-configs $LC_NAME --region $REGION

    as-describe-auto-scaling-groups $SG_NAME --region $REGION
    as-describe-scaling-activities $SG_NAME --region $REGION

    mon-describe-alarms --region $REGION

### Delete everything

    as-update-auto-scaling-group $SG_NAME --min-size 0 --max-size 0 --region $REGION
    # -> wait for instances to be terminated (or terminate by hand in aws console)

    as-delete-auto-scaling-group $SG_NAME --region $REGION -f
    as-delete-launch-config $LC_NAME --region $REGION -f

    elb-delete-lb $LB_NAME --force --region $REGION

### Connect to all instances

    source config/FOLDER/settings.sh && cap shell

TODO
====
 - make download_tools script always fetch the newest version (no hardcoded versions)
 - modify PATH only once

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold anyone accountable...
