

resource "aws_launch_configuration" "asg_instance" {
  image_id = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  key_name = "NVirginia_home"
  security_groups = ["${aws_security_group.anywhere_new.id}"]
  user_data = <<-EOF
            #!/bin/bash
            yum update -y
            yum -y install httpd
            service httpd start
            chkconfig httpd on
            echo "hello world "  > /var/www/html/index.html
            EOF
  lifecycle {
    create_before_destroy = true
  }
}

data "aws_availability_zones" "all" {}

resource "aws_autoscaling_group" "asg_instance" {
  max_size = 10
  min_size = 2

  launch_configuration = "${aws_launch_configuration.asg_instance.id}"
  availability_zones = ["${data.aws_availability_zones.all.names}"]

  load_balancers = ["${aws_elb.elb.name}"]
  health_check_type = "ELB"
  lifecycle {
    create_before_destroy = true
  }
}