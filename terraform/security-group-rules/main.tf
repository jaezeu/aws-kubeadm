resource "aws_security_group_rule" "master_first" {
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  security_group_id = data.aws_security_group.master_sg.id
  source_security_group_id = data.aws_security_group.worker_sg.id
}

resource "aws_security_group_rule" "worker_first" {
  type              = "ingress"
  from_port         = 10250
  to_port           = 10250
  protocol          = "tcp"
  security_group_id = data.aws_security_group.worker_sg.id
  source_security_group_id = data.aws_security_group.master_sg.id
}

resource "aws_security_group_rule" "worker_second" {
  type              = "ingress"
  from_port         = 30000
  to_port           = 32767
  protocol          = "tcp"
  security_group_id = data.aws_security_group.worker_sg.id
  source_security_group_id = data.aws_security_group.master_sg.id
}

