resource "aws_route_table" "tfer--rtb-0ce4f2701d9d1ced9" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0a124d7e9f9a184d0"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-02b510a7e58f9f433_id}"
}
