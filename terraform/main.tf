module "ec2" {
  source   = "./modules/ec2"
  my_ip    = var.my_ip
  git_repo = var.git_repo
}
