resource "aws_route53_zone" "dasarath-site" {
   name = "dasarath.com"
}
resource "aws_route53_record" "server1-record" {
   zone_id = "${aws_route53_zone.dasarath-site.zone_id}"
   name = "server1.dasarath.com"
   type = "A"
   ttl = "300"
   records = ["104.236.247.8"]
}
resource "aws_route53_record" "www-record" {
   zone_id = "${aws_route53_zone.dasarath-site.zone_id}"
   name = "www.dasarath.com"
   type = "A"
   ttl = "300"
   records = ["104.236.247.8"]
}
resource "aws_route53_record" "mail1-record" {
   zone_id = "${aws_route53_zone.dasarath-site.zone_id}"
   name = "dasarath.com"
   type = "MX"
   ttl = "300"
   records = [
     "1 aspmx.l.google.com.",
     "5 alt1.aspmx.l.google.com.",
     "5 alt2.aspmx.l.google.com.",
     "10 aspmx2.googlemail.com.",
     "10 aspmx3.googlemail.com."
   ]
}

output "ns-servers" {
   value = "${aws_route53_zone.dasarath-site.name_servers}"
}
