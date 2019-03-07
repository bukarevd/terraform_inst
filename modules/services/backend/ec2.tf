variable "port" {
  description = "port anywhere_new"
  default = 0
}

variable "instances_names" {
  description = "instances names"
  type = "list"
  default = ["one", "two", "three"]
}

resource "aws_instance" "test" {
  count = "${length(var.instances_names)}"
  ami = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"

  key_name = "NVirginia"
  vpc_security_group_ids = ["${aws_security_group.anywhere_new.id}"]

  tags {
    Name = "${element(var.instances_names, count.index)}"
  }
}

resource "aws_security_group" "anywhere_new" {
  name = "${var.cluster_name}-elb"

  ingress {
    from_port = "${var.port}"
    protocol = "-1"
    to_port = "${var.port}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = "${var.port}"
    protocol = "-1"
    to_port = "${var.port}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}




