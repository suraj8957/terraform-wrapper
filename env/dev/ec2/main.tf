module "ec2" {
  source = "git::https://github.com/suraj8957/terraform-modules.git//ec2"

  region        = var.dev_region
  ami           = var.dev_instance_ami
  instance_type = var.dev_instance_type
  instance_name = var.dev_instance_name
}
