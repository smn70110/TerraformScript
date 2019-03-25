resource "aws_instance" "example" {
  ami                    = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.example-instance.id}"]
  subnet_id              = "${aws_subnet.main-public-1.id}"
  key_name               = "${aws_key_pair.mykey.key_name}"

  tags {
    Name = "main"
  }
}
