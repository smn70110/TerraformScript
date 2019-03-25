terraform{
# you have to run aws configure before running this file as this backend file is not accepting any variables
	backend "consul"{
		address="demo.consul.io" # hostname of consul cluster
		path="terraform/myproject"
	}
	backend "s3"{
		bucket="mybucket"
		key="terraform/myproject"
		region="eu-west-1"
	}
}
