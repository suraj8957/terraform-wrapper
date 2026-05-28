module "ec2" {
  source = "/home/suraj/terraform-modules/ec2"

  region        = var.qa-region
  ami           = var.qa-instance-ami
  instance-type = var.qa-instance-type
  instance-name = var.qa-instance-name
}
