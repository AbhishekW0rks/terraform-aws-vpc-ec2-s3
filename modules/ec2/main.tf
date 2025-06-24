resource "aws_instance" "web" {
  ami                    = "ami-0c2b8ca1dad447f8a"  
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "web-instance"
  }
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}

resource "aws_security_group" "allow_ssh" {
  name   = "allow_ssh"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
