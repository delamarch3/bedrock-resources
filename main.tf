terraform {
  backend "s3" {
    bucket = "delamarch3-terraform-state"
    key    = "bedrock-resources"
    region = "eu-west-2"
    use_lockfile = true
  }
}

provider "aws" {
 default_tags {
   tags = {
     terraform = "true"
   }
 }
}
