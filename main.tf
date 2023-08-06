provider "aws" {
  region = "ap-south-1"  # Change this to your desired AWS region
  access_key = var.aws_access_key        # imports values form your vars.tfvars files
  secret_key = var.aws_secret_key
}

resource "aws_instance" "example" {
  ami           = "ami-0a5090b83e43aa04d"  # Amazon Linux 2 AMI ID for us-east-1, change it to your region
  instance_type = "t2.micro"  # Change the instance type as per your requirements
  key_name      = "server-key"  # Replace with your own key pair name

  tags = {
    Name = "Server_infra-1"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
