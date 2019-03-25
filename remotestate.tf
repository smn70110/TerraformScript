data "terraform_remote_state" "aws_state"
{
	backend="s3"
	config
	{
		bucket="terraform-state"
		key="terraform.tfstate"
		access_key="${var.AWS_ACCESS_KEY}"
		secret_key="${var.AWS_SECRET_KEY}"
		region="${var.AWS_REGION}"
	}
}