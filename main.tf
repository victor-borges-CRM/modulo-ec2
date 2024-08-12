data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_vpc" "vpc_padrao" {
  id = var.vpc_id
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.tipo_instancia
  #iam_instance_profile = aws_iam_instance_profile.perfil_ec2.name
  #vpc_security_group_ids = 

  tags = {
    Name = var.nome
  }
}