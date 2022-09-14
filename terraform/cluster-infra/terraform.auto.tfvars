key_pair_name = "amz-kubeadm-key"
# EC2
master_instance_type               = "t2.medium"
subnet_id                          = "" #specify subnet to deploy in
associate_public_ip_address        = true
master_root_volume_size            = 20
master_root_volume_type            = "gp2"

worker_instance_type               = "t2.medium"
worker_root_volume_size            = 20
worker_root_volume_type            = "gp2"