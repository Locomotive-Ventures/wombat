resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-AlarmHigh-34520bf4-9be7-47fd-aa66-153430fb7c55" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-AlarmHigh-34520bf4-9be7-47fd-aa66-153430fb7c55"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "2"
  metric_name        = "ConsumedReadCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "60"
  statistic          = "Sum"
  threshold          = "42"
  treat_missing_data = "missing"
}

resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-AlarmHigh-879abb32-da55-428f-919b-70f795c3eac5" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-AlarmHigh-879abb32-da55-428f-919b-70f795c3eac5"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "2"
  metric_name        = "ConsumedWriteCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "60"
  statistic          = "Sum"
  threshold          = "42"
  treat_missing_data = "missing"
}

resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-AlarmLow-46bdcf5e-1aeb-4b87-82c6-611d277047c9" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-AlarmLow-46bdcf5e-1aeb-4b87-82c6-611d277047c9"
  comparison_operator = "LessThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "15"
  metric_name        = "ConsumedWriteCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "60"
  statistic          = "Sum"
  threshold          = "30"
  treat_missing_data = "missing"
}

resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-AlarmLow-e410cb1c-8541-43dd-b7a1-f2b9e59dff18" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-AlarmLow-e410cb1c-8541-43dd-b7a1-f2b9e59dff18"
  comparison_operator = "LessThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "15"
  metric_name        = "ConsumedReadCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "60"
  statistic          = "Sum"
  threshold          = "30"
  treat_missing_data = "missing"
}

resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-ProvisionedCapacityHigh-a3a10082-01f8-4708-81e3-704accdef7a3" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-ProvisionedCapacityHigh-a3a10082-01f8-4708-81e3-704accdef7a3"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "3"
  metric_name        = "ProvisionedWriteCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-ProvisionedCapacityHigh-b6a9b113-855c-44d0-b884-4b880ccbe08b" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-ProvisionedCapacityHigh-b6a9b113-855c-44d0-b884-4b880ccbe08b"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "3"
  metric_name        = "ProvisionedReadCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-ProvisionedCapacityLow-294bea70-b4e9-407d-829a-2e0541c528d2" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:cc79e40d-29f8-4161-8e6f-63ae64831330:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/b1486554-b70f-4996-b8f2-7b0920065c4b."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-ProvisionedCapacityLow-294bea70-b4e9-407d-829a-2e0541c528d2"
  comparison_operator = "LessThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "3"
  metric_name        = "ProvisionedReadCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

resource "aws_cloudwatch_metric_alarm" "tfer--TargetTracking-table-002F-wombat-tf-statelock-ProvisionedCapacityLow-311f0c6a-9e1b-4088-b814-7c054100a3bb" {
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407"]
  alarm_description   = "DO NOT EDIT OR DELETE. For TargetTrackingScaling policy arn:aws:autoscaling:ap-southeast-2:692811742553:scalingPolicy:7f2d13b3-f737-4f1b-bbf5-cc59143dbaac:resource/dynamodb/table/wombat-tf-statelock:policyName/$wombat-tf-statelock-scaling-policy:createdBy/bb5a089a-acf1-49cd-942c-c646110ea407."
  alarm_name          = "TargetTracking-table/wombat-tf-statelock-ProvisionedCapacityLow-311f0c6a-9e1b-4088-b814-7c054100a3bb"
  comparison_operator = "LessThanThreshold"
  datapoints_to_alarm = "0"

  dimensions = {
    TableName = "wombat-tf-statelock"
  }

  evaluation_periods = "3"
  metric_name        = "ProvisionedWriteCapacityUnits"
  namespace          = "AWS/DynamoDB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}
