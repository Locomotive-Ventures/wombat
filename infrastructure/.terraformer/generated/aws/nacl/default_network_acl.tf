resource "aws_default_network_acl" "tfer--acl-0d58bc12248100844" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-062b5f96da6bc04e4_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-06cbb2a6951bb7885_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0f5134bb92f28c150_id}"]
}
