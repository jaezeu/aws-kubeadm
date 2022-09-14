variable "key_pair_name" {}
#ec2 master
variable "master_instance_type" {}
variable "subnet_id" {}
variable "associate_public_ip_address" {}
variable "master_root_volume_size" {}
variable "master_root_volume_type" {}

#ec2 worker
variable "worker_instance_type" {}
variable "worker_root_volume_size" {}
variable "worker_root_volume_type" {}