

resource "aws_security_group" "sg" {
    name = "Terraform-1"
    vpc_id = aws_vpc.vp1.id
    description = "Allow ssh and httpd"
    
    
    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        #cidr_blocks = ["0.0.0.0/0"]    # this can not be open to the world bc its our ec2 sg
        security_groups = [aws_security_group.sg2.id]
    }
    
 
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
  }
}


resource "aws_security_group" "sg2" {
    name = "terraform-sg-lb"
    vpc_id = aws_vpc.vp1.id
    description = "Allow ssh and httpd"
    
    
    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]     # Lb can be open to the world
    }
    
 
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
    created-by-terraform = "yes"
  }
}