resource "aws_lb" "app_alb" {
  name               = "${var.project_name}-${var.environment}-app-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.app-alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
                        ## alb requires min 2 subnets for high availability

  enable_deletion_protection = false

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-app-alb"
    }
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>This is fixed response from APP ALB</h1>"
      status_code  = "200"
    }
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name
  
  records = [
    {
      name    = "*.app-${var.environment}"
      type    = "A"
      allow_overwrite = true
      alias   = {
        name    = aws_lb.app_alb.dns_name
        zone_id = aws_lb.app_alb.zone_id
      }
    }
  ]
}
## since we are giving *.app-dev ----> we can give any name in place of * to access website.
## ex: ---> backend.app-dev.pspkdevops.online, frontend.app-dev.pspkdevops.online
## ex: a.app-dev.pspkdevops.online, xyz.app-dev.pspkdevops.online, ab123.app-dev.pspkdevops.online, etc,.