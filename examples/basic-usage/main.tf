module "vpc" {
  source   = "akirosit/vpc-sample/aws"
  vpc_cidr = "10.1.0.0/16"
}
