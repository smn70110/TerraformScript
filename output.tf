output "instance" {
  value = "${aws_instance.example.public_ip}"
}
output "rds" {
  value = "${aws_db_instance.mariadb.endpoint}"
}
output "ns-servers" {
   value = "${aws_route53_zone.dasarath-site.name_servers}"
}
output "ELB" {
	value = "${aws_elb.my-elb.dns_name}"
}
