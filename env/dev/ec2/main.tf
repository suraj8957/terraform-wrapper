module "ec2" {
  source = "git::https://github.com/suraj8957/terraform-modules.git//ec2"

  region        = var.dev-region
  ami           = var.dev-instance-ami
  instance-type = var.dev-instance-type
  instance-name = var.dev-instance-name
}
