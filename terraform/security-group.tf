resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Habilitar o acesso via ssh"
  
  ingress {
    description      = "Habilitar o acesso via ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["138.186.40.209/32"]
  }

  tags = {
    Name = "ssh"
  }
}
