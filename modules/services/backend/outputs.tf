output "public_ip" {
  value = "${aws_elb.elb.dns_name}"
}

output "instance" {
  value = "${aws_instance.test.public_ip}"
}

output "asg" {
  value = "${aws_autoscaling_group.asg_instance.name}"
}