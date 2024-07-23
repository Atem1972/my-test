resource "aws_internet_gateway" "gtw1" {
  vpc_id = aws_vpc.vp1.id
}