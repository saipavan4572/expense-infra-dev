resource "aws_ssm_parameter" "web_alb_listener_arn" {
  name  = "/${var.project_name}/${var.environment}/web_alb_listener_arn"    ## ex: vpc-0f3218f3f5776f9a5
  type  = "String"    ## AWS Notation -- type = "String"
  value = aws_lb_listener.http.arn
}

resource "aws_ssm_parameter" "web_alb_listener_arn_https" {
  name  = "/${var.project_name}/${var.environment}/web_alb_listener_arn_https"    ## ex: vpc-0f3218f3f5776f9a5
  type  = "String"    ## AWS Notation -- type = "String"
  value = aws_lb_listener.https.arn
}
