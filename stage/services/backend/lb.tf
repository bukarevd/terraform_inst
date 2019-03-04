resource "aws_elb" "elb" {
  availability_zones = ["${data.aws_availability_zones.all.names}"]
  security_groups = ["${aws_security_group.anywhere_new.id}"]

  "listener" {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    interval = 30
    target = "HTTP:80/"
    timeout = 3

  }
}