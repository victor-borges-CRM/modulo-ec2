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
#===================================================================================
#KEY PAIR
#===================================================================================
resource "tls_private_key" "chave_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "Teste_conexao"
  public_key = tls_private_key.chave_ssh.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.chave_ssh.private_key_pem}' > ./'Teste_conexao'.pem
      chmod 400 ./'Teste_conexao'.pem
    EOT
  }
}

#===================================================================================
#VPC
#===================================================================================
data "aws_vpc" "vpc_padrao" {
  id = var.vpc_id
}

#===================================================================================
#SUBNET
#===================================================================================
data "aws_subnet" "selected" {
  id = var.subnet_id
}

#===================================================================================
#INSTANCIA EC2
#===================================================================================
resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.tipo_instancia
  iam_instance_profile        = var.iam_instance_profile
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = data.aws_subnet.selected.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated_key.key_name

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = var.nome
  }
}