resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Habilitar o acesso via ssh"
  
  ingress {
    description      = "Habilitar o acesso via ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider    = aws.us-east-2
  name        = "acesso-ssh-us-east-2"
  description = "Habilitar o acesso via ssh"
  
  ingress {
    description      = "Habilitar o acesso via ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
}
