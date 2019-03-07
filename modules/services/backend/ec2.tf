variable "port" {
  description = "port anywhere_new"
  default = 0
}

resource "aws_instance" "test" {
  count = 3
  ami = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"

  key_name = "NVirginia"
  vpc_security_group_ids = ["${aws_security_group.anywhere_new.id}"]

  tags {
    Name = "testServer.${count.index}"
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




