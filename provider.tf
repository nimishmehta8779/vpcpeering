provider "aws" {
	region = var.region
}
# provider "aws" {
# 	region = var.region
# 	alias = "accepter"
#     assume_role {
#     role_arn     = var.cross_iam_role
#     session_name = "SESSION_NAME"
    
#   }
# }
provider "aws" {
	region = "us-east-1"
	alias = "accepter"
	profile = "accepter"
}