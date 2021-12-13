
#Qual o provedor e a versão dele
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

#Criando o ambiente
resource "aws_instance" "dev" {
  #Utilizando uma imagem UBUNTU18.0LTS
  #!!Atenção > para cada região existe um id diferente para cada imagem
  count = 3
  ami = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
  ami = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}


resource "aws_s3_bucket" "dev4" {
  bucket = "rlimanogueira-dev4"
  acl    = "private"

  tags = {
    Name        = "rlimanogueira-dev4"
  }
}