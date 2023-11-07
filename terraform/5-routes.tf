// Create Web route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.smpVPC.id
  
  route = [
  {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = ""
    carrier_gateway_id = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id = ""
    gateway_id = aws_internet_gateway.igw.id
    instance_id = ""
    ipv6_cidr_block = ""
    local_gateway_id = ""
    network_interface_id = ""
    transit_gateway_id = ""
    vpc_endpoint_id = ""
    vpc_peering_connection_id = ""
  },
]
    

  tags = {
    Name = "public-rt"
  }
}

// Create App Route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.smpVPC.id
  
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = ""
      nat_gateway_id = aws_nat_gateway.nat.id
      carrier_gateway_id = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id = ""
      instance_id = ""
      ipv6_cidr_block = ""
      local_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    },
]
  
  tags = {
    Name = "private-rt"
  }
}

//Create route table associtation
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.private-rt.id
}