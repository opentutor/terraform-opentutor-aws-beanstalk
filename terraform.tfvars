# NOTE:
# goal is to define terraform-opentutor-aws-beanstalk as a module
# so all deployment-specific tfvars should then be separated out
# to each deployment that uses the module
region = "us-east-1"

availability_zones = ["us-east-1a", "us-east-1b"]

namespace = "ict"

stage = "test"

name = "opentutor"

description = "test opentutor env"

tier = "WebServer"

environment_type = "LoadBalanced"

loadbalancer_type = "application"

availability_zone_selector = "Any 2"

instance_type = "t3.xlarge"

autoscale_min = 1

autoscale_max = 2

wait_for_ready_timeout = "20m"


force_destroy = true

rolling_update_enabled = true

rolling_update_type = "Health"

updating_min_in_service = 0

updating_max_batch = 1

healthcheck_url = "/"

application_port = 80

root_volume_size = 8

root_volume_type = "gp2"

autoscale_measure_name = "CPUUtilization"

autoscale_statistic = "Average"

autoscale_unit = "Percent"

autoscale_lower_bound = 20

autoscale_lower_increment = -1

autoscale_upper_bound = 80

autoscale_upper_increment = 1

elb_scheme = "public"

// https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html
// https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.docker
# solution_stack_name = "64bit Amazon Linux 2018.03 v2.12.17 running Docker 18.06.1-ce"
solution_stack_name = "64bit Amazon Linux 2018.03 v2.23.0 running Multi-container Docker 19.03.6-ce (Generic)"
version_label = ""

# we shouldn't need to hardcode dns_zone_id
# but in case we do,
# the dns_zone_id for elastic beanstalk in region us-east-1 is below
# dns_zone_id = "Z117KPS5GTRQ2G"

// https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html
additional_settings = [
  {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "StickinessEnabled"
    value     = "false"
  },
  {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ManagedActionsEnabled"
    value     = "false"
  }
]

# env_vars = {
#   "DB_HOST"         = "xxxxxxxxxxxxxx"
#   "DB_USERNAME"     = "yyyyyyyyyyyyy"
#   "DB_PASSWORD"     = "zzzzzzzzzzzzzzzzzzz"
#   "ANOTHER_ENV_VAR" = "123456789"
# 