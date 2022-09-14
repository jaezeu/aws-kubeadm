resource "aws_instance" "worker" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.worker_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.worker-sg.id]
  associate_public_ip_address = var.associate_public_ip_address
  source_dest_check           = false
  key_name                    = aws_key_pair.key_pair.key_name
  user_data                   = file("../../userdata.sh")
  
  # root disk
  root_block_device {
    volume_size           = var.worker_root_volume_size
    volume_type           = var.worker_root_volume_type
    delete_on_termination = true
  }
  
  tags = {
    Name = "kube-worker"
  }
}