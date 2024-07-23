# Public route table

resource "aws_route_table" "rtpri" {
  vpc_id = aws_vpc.vp1.id  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtw1.id
  }
}

# private route table

resource "aws_route_table" "rtpr" {
  vpc_id = aws_vpc.vp1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat1.id
  }
}

# route and public subnet association

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.rtpri.id
}
resource "aws_route_table_association" "rta2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.rtpr.id
}

# route and private subnet association

resource "aws_route_table_association" "rta3" {
  subnet_id = aws_subnet.private1.id  
  route_table_id = aws_route_table.rtpri.id
}
resource "aws_route_table_association" "rta4" {
  subnet_id = aws_subnet.private2.id  
  route_table_id = aws_route_table.rtpri.id
}