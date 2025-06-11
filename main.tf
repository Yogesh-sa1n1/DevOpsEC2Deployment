provider "aws" {
    region = var.region
}

resource "aws_security_group" "sg" {
  name        = "TerraformSG"
  description = "Allow inbound rule ssh and http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow ssh and http"
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.sg.name]
  user_data = file("config.sh")
   tags = {
    Name = "HelloWorld"
  }
}

output "done" {
  value = aws_instance.ec2_instance.public_ip
}

  
  
