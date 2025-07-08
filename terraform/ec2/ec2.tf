resource "aws_instance" "roboshop" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.allow_all.id]
    tags = {
      Name = "Hello-world"
    }
  
}

resource "aws_security_group" "allow_all" { #allow all means this is for internal purpose
    name = "allow-all-ec2" # this is security gruop name , internal name
    
    ingress {
        from_port = 0 # we can give specfic ports
        to_port = 0
        protocol = "-1" # allowing all protocols like TCP,HTTP,HTTPS
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
        Name="allow-all-traffic" # visiblename in aws console Name
    }
  
}