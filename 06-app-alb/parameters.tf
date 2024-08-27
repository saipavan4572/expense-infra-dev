resource "aws_ssm_parameter" "app_alb_listener_arn" {
  name  = "/${var.project_name}/${var.environment}/app_alb_listener_arn"    ## ex: vpc-0f3218f3f5776f9a5
  type  = "String"    ## AWS Notation -- type = "String"
  value = aws_lb_listener.http.arn
}
