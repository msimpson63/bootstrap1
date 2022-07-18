provider "aws"  {
    region = "us-west-2"
    # access_key = ""
    # secret_key = ""
    #  key_name = "or-kp"
}

resource "aws_instance" "MarkServer" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t3.micro"
  key_name = "or-kp"

  tags = {
    Name = "HelloWorld"
  } 
}

resource "aws_vpc" "first_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "production"
  }
}

    # user-data = <<-EOF
    #     sudo apt update -y
    #     sudo apt install apache2 -y
    #     sudo systemctl start apache2
    #     EOF

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.first_vpc.id
  cidr_block = "172.16.0.0/24"

  

  tags = {
    Name = "Maprodin"

    user_data = <<-EOF
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo bash -c 'echo your very first web server > /var/www/html/index.html'
        EOF
  }
}

