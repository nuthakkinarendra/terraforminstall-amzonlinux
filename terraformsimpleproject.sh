resource "aws_instance" "web" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name = "terraform"

  tags = {
    Name = "MYCSS-Template"
  }

  connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("terraform.pem")  # Update with the path to your private key
      host     = aws_instance.web.public_ip
    }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sleep 5",
      "sudo apt-get install nginx -y",
      "sudo apt-get install zip -y",
      "sudo apt-get install unzip -y",
      "wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip",
      "sudo unzip mediplus-lite.zip",
      "sudo mv mediplus-lite /var/www/html/"
    ]
  }
}
