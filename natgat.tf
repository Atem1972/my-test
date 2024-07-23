resource "aws_eip" "el1" {
  
}

resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.el1.id
  subnet_id = aws_subnet.public1.id
}