resource "aws_key_pair" "vpn" {
  key_name   = "vpn"
  # you can paste the public key directly like this
  #public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL6ONJth+DzeXbU3oGATxjVmoRjPepdl7sBuPzzQT2Nc sivak@BOOK-I6CR3LQ85Q"
  # public_key = file("~/.ssh/openvpn.pub")
  public_key = file("D:/Personal/DevOps/JoinDevOps-SivaKumarReddy/Practice/test-keypair-3.pub")
  # ~ means windows home directory
}

module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  key_name  = aws_key_pair.vpn.key_name
  name = "${var.project_name}-${var.environment}-vpn"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  subnet_id              = local.public_subnet_id
  ami       = data.aws_ami.ami_info.id

  tags = merge(
    var.common_tags,
    {
        name = "${var.project_name}-${var.environment}-vpn"
    }
  )
}