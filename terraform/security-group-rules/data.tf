data "aws_security_group" "master_sg" {
  name = var.master_sg
}

data "aws_security_group" "worker_sg" {
  name = var.worker_sg
}