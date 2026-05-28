module "ec2" {
  source = "git::https://github.com/suraj8957/terraform-modules.git//ec2"

  region        = var.qa_region
  ami           = var.qa_instance_ami
  instance_type = var.qa_instance_type
  instance_name = var.qa_instance_name
}
