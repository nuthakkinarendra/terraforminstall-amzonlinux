terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"
# key_name = "terraform"

  tags = {
    Name = "version-v2"
  }

  connection {
      type     = "ssh"
      user     = "ubuntu"
 #    private_key = file("terraform.pem")  # Update with the path to your private key
      host     = aws_instance.web.public_ip
    }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sleep 5",
      "sudo yum install nginx -y",
      "sudo yum install zip -y",
      "sudo yum install unzip -y",
      "wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip",
      "sudo unzip mediplus-lite.zip",
      "sudo mv mediplus-lite /var/www/html/"
    ]
  }
}
