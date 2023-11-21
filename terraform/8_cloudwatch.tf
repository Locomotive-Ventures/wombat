data "aws_ec2_instance" "example" {
  instance_id = "i-0123456789abcdef0"
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = "example"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  threshold           = "80"

  metric_query {
    expression = "AVG(NetworkOut) / 300"
    id         = "m1"
    label      = "out"
  }

  namespace = "AWS/EC2"
  period    = "300"
  statistic = "Average"
  unit      = "Seconds"

  dimensions = {
    InstanceId = data.aws_ec2_instance.example.id
  }

  alarm_description     = "This metric monitors ec2 network out"
  treat_missing_data_as = "breaching"
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = "example"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  threshold           = "90"
  statistic           = "Average"

  dimensions = {
    InstanceId = "i-0123456789abcdef0"
  }

  alarm_description     = "This metric monitors ec2 CPU utilization"
  treat_missing_data_as = "notBreaching"
}
