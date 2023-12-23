resource "aws_security_group" "web" {
  name   = "web"
  vpc_id = local.vpc_id
  ingress {
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    protocol    = local.tcp
    cidr_blocks = [local.anywhere]
  }

  ingress {
    from_port   = local.http_port
    to_port     = local.http_port
    protocol    = local.tcp
    cidr_blocks = [local.anywhere]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  tags = {
    Name = "web"
  }
  depends_on = [aws_subnet.subnets]
}

data "aws_ami_ids" "ubuntu_2204" {
  owners = ["099720109477"]


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20220712.1"]
  }

}

data "aws_subnet" "web" {
  vpc_id = local.vpc_id
  filter {
    name   = "tag:Name"
    values = [var.ntier_vpc_info.web_ec2_subnet]
  }

  depends_on = [aws_subnet.subnets]

}

resource "aws_key_pair" "private" {
  key_name   = "ntier"
  public_key = file(var.public_key_path)
  tags = {
    CreatedBy = "terraform"
  }
}

resource "aws_instance" "webinstance" {
  ami                         = data.aws_ami_ids.ubuntu_2204.ids[0]
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.private.key_name
  subnet_id                   = data.aws_subnet.web.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags = {
    Name = "web1"
  }
  
  depends_on = [aws_security_group.web]

}

resource "null_resource" "ntiernull" {
  triggers = {
    rollout_version = var.rollout_version
  }
  connection {
    host        = aws_instance.webinstance.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    type        = "ssh"

  }
  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install tree -y"]
  }

  
}

