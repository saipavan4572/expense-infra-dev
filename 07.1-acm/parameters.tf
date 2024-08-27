resource "aws_ssm_parameter" "acm_certificate_arn" {
  name  = "/${var.project_name}/${var.environment}/acm_certificate_arn"    ## ex: vpc-0f3218f3f5776f9a5
  type  = "String"    ## AWS Notation -- type = "String"
  value = aws_acm_certificate.expense.arn
}
