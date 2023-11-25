resource "aws_main_route_table_association" "tfer--vpc-02b510a7e58f9f433" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0ce4f2701d9d1ced9_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-02b510a7e58f9f433_id}"
}
