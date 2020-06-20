locals {
  count = var.enabled ? 1 : 0
}

resource "aws_vpc_peering_connection" "vpc_peer_owner" {
    count = local.count
    vpc_id = var.owner_vpc_id
    peer_vpc_id = data.aws_vpc.accepter.id
    peer_owner_id = local.accepter_account_id

    tags = {
        Name = "vpc_peer_to_dev"
    }
}

resource "aws_vpc_peering_connection_accepter" "vpc_peer_aceepter" {
   count = local.count
    provider = aws.accepter
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_owner[0].id
    auto_accept = true

    tags = {
        Name = "vpc_peer_to_ss"
    }
}
// Create route table in destination account
resource "aws_route_table" "accepter_vpn_route_table" {
    count = local.count
    provider = aws.accepter
    vpc_id = var.accepter_vpc_id

    tags = {
	Name = "vpc_peer_route_table"
}
}

resource "aws_route" "accepter_vpn_route_table" {
    count = local.count
    provider = aws.accepter
    route_table_id = aws_route_table.accepter_vpn_route_table[0].id
    destination_cidr_block = var.owner_vpc_subnet_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_owner[0].id
}

// Create route table in source account
resource "aws_route_table" "source_vpn_route_table" {
    count = local.count
    vpc_id = var.owner_vpc_id
    tags = {

	Name = "vpc_peer_route_table"
}
}

resource "aws_route" "vpn_route_source" {
	count = local.count
    route_table_id = aws_route_table.source_vpn_route_table[0].id
    destination_cidr_block = var.accepter_vpc_subnet_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_owner[0].id
}

