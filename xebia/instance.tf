resource "aws_instance" "example" {
  ami                    = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.mykey.key_name}"
  subnet_id              = "${aws_subnet.main-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"

    connection {
      user       = "${var.INSTANCE_USERNAME}"
      private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    user       = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }

  tags {
    Name = "main"
  }
}

output "ip" {
  value = "${aws_instance.example.public_ip}"
}
