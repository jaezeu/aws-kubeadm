# aws-kubeadm repository

This repository contains information on how to automate the creation of a single master, multi worker node setup on AWS using EC2. The terraform code in this repo is only used to create the following resources:

* 1 Master and worker nodes
* 1 shared key pair to be used by the master and worker nodes
* 1 security group for master node
* 1 security group for worker node

Therefore, you have to have an existing subnet and VPC to run this terraform code in. Just input the `"subnet_id"` in the `terraform.auto.tfvars` in the cluster-infra folder.

Moreover, please run terraform plan/apply in the cluster-infra folder, prior to running it in the security-group-rules folder. The cluster-infra creates the required security groups for the master and worker. I had to separate out the rules as there is a cyclic dependency in rules between the master and worker nodes.

* `userdata.sh` - This would be ran in both worker and master nodes, as part of the k8s pre requisites.

* `kubemaster.sh` - Run this only on the master node, once all the infrastruture is up. Refer to comments.


For more information, you may refer to: https://medium.com/@jaezeu/automating-kubeadm-in-aws-ec2-using-terraform-and-user-data-94fd28c49284