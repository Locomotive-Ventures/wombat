resource "aws_internet_gateway" "tfer--igw-0a124d7e9f9a184d0" {
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-02b510a7e58f9f433_id}"
}
