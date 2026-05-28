module "ec2" {
  source = "/home/suraj/terraform-modules/ec2"

  region        = var.dev-region
  ami           = var.dev-instance-ami
  instance-type = var.dev-instance-type
  instance-name = var.dev-instance-name
}
