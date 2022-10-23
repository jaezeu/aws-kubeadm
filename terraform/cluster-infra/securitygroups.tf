resource "aws_security_group" "master-sg" {
  name        = "kubeadm-master-sg"
  description = "security group of kube master node"

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = # ["0.0.0.0/0"]              #set only to personal IP
    description = "Allow incoming SSH connections"
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "worker-sg" {
  name        = "kubeadm-worker-sg"
  description = "security group of kube worker nodes"

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = # ["0.0.0.0/0"]           #set only to personal IP
    description = "Allow incoming SSH connections"
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
