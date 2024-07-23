resource "aws_instance" "belo" {
    ami = "ami-0195204d5dce06d99"
    instance_type = "t2.micro"
      subnet_id = aws_subnet.public1.id
  # security_groups = [aws_security_group.sg-demo.name]
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name      = aws_key_pair.aws_key.key_name
  user_data     = file("install.sh")
  tags ={
    Name = "utc-app-inst"
  }
}
resource "aws_instance" "belo2" {
    ami = "ami-0195204d5dce06d99"
    instance_type = "t2.micro"
      subnet_id = aws_subnet.public1.id
  # security_groups = [aws_security_group.sg-demo.name]
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name      = aws_key_pair.aws_key.key_name
  user_data     = file("install.sh")
  tags ={
    Name = "utc-app-inst"
  }
}