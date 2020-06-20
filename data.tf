data "aws_vpc" "owner" {
 id = var.owner_vpc_id
}

data "aws_vpc" "accepter" {
  provider = aws.accepter
  id = var.accepter_vpc_id
}

locals {
  accepter_account_id = "${element(split(":", data.aws_vpc.accepter.arn),4)}"
}

data "aws_route_tables" "vpn_accepter" {
  provider = aws.accepter
  vpc_id = var.accepter_vpc_id
}
data "aws_route_tables" "vpn_owner" {
  vpc_id = var.owner_vpc_id
}
