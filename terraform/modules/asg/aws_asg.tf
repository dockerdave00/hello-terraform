resource "aws_placement_group" "asg" {
  name                       = "terraform-asg-pg"
  strategy                   = "partition"
}

resource "aws_launch_template" "asg" {
  name_prefix                = "terraform-asg-lt"
  image_id		     = var.latest_ami
  instance_type              = var.asg_instance_type
  vpc_security_group_ids    = [ var.asg_security_group ]
  user_data		     = "${base64encode(var.user_data)}"
}

resource "aws_autoscaling_group" "asg" {
  name		             = "terraform-asg"
  desired_capacity	     = 2
  max_size 	             = 2
  min_size 	       	     = 1
  health_check_grace_period  = 300
  health_check_type          = "ELB"
  force_delete		     = true
  placement_group            = aws_placement_group.asg.id
  vpc_zone_identifier        = var.private_subnet_ids
  load_balancers 	     = [ var.elb_name ]
  launch_template {
    id                       = aws_launch_template.asg.id
    version                  = "$Latest"
  }

  tag {
    key = "Name"
    value = "terraform-asg"
    propagate_at_launch = true
  }
}
