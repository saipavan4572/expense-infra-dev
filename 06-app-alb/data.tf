data "aws_ssm_parameter" "app-alb_sg_id" {
  name = "/${var.project_name}/${var.environment}/app-alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ami" "ami_info" {

    most_recent = true
    owners = ["679593333241"] # owner account ID of OpenVPN ami
    filter {
        name   = "name"        # filter by name
        values = ["OpenVPN Access Server Community Image-fe8020db-*"]     # AMI name
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}