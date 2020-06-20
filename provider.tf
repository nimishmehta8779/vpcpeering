provider "aws" {
	region = "us-east-1"
}
provider "aws" {
	region = "us-east-1"
	alias = "accepter"
	profile = "accepter"
}
	
