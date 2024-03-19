resource "aws_instance" "Web-Server" {
  
  instance_type = "t2.micro"
  ami = var.free-ami
  subnet_id = var.pub-sub-a
  security_groups = [var.all-allowed-sg]
  
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    
    EOF
    
   tags = {
     Name = "web-server"
   }

 
}
