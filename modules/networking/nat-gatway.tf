# --- vpc/nat-gateway.tf ---

#create eip to attach to NAT for private subnet az1
resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc = true

  tags = {
    Name = "private eip az1"
  }
}

#create eip to attach to NAT for private subnet az2
resource "aws_eip" "eip-for-nat-gateway-2" {
  vpc = true

  tags = {
    Name = "private eip az2"
  }
}

#create NAT Gateway to control traffic to private subnet az1
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.eip-for-nat-gateway-1.id
  subnet_id     = aws_subnet.private_app_subnet_az1.id

  tags = {
    "Name" = "Nat Gateway Private Subnet 1"
  }

}

#create NAT Gateway to control traffic to private subnet az2
resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id = aws_eip.eip-for-nat-gateway-2.id
  subnet_id     = aws_subnet.private_app_subnet_az2.id

  tags = {
    "Name" = "Nat Gateway Private Subnet 2"
  }

}