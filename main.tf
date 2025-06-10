resource "aws_instance" "terraform" {
  ami           = lookup(var.amis, var.aws_region)
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

output "ec2-ip" {
  value = aws_instance.terraform.public_ip

}

resource "aws_s3_bucket" "terraform" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
output "s3-Name" {
  value = aws_s3_bucket.terraform.bucket


}