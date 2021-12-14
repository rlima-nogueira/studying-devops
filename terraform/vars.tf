variable "amis" {
  default = {
      "us-east-1" = "ami-0279c3b3186e54acd"
      "us-east-2" = "ami-002068ed284fb165b"
  }
}

variable "cdirs_acesso_remoto" {
  default = ["138.186.40.209/32"]
}