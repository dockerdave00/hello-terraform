resource "aws_elb" "elb" {
  name                  = var.elb_name
  subnets		= var.public_subnet_ids

  listener {
    instance_port       = var.ec2_instance_port
    instance_protocol   = "http"
    lb_port	        = 80
    lb_protocol	        = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout		= 3
    target		= var.elb_health_check_target
    interval		= 30
  }

  tags = {
    Name                = "terraform-elb" 
  }
}

resource "aws_elb_attachment" "instance" {
  elb			= aws_elb.elb.id
  instance		= var.aws_ec2_instance_id
}
