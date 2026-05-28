module "ec2" {
  source = "git::https://github.com/suraj8957/terraform-modules.git//ec2"

  region        = var.qa-region
  ami           = var.qa-instance-ami
  instance-type = var.qa-instance-type
  instance-name = var.qa-instance-name
}
