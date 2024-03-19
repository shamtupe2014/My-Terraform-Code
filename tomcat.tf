resource "aws_instance" "App-Server" {
  ami = var.free-ami
  instance_type = "t2.micro"
  security_groups = [ var.all-allowed-sg ]
  subnet_id = var.pub-sub-b
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.tar.gz
    mv apache-tomcat-9.0.86.tar.gz /etc
    cd /etc
    tar xfz apache-tomcat-9.0.86.tar.gz
    cd /etc/apache-tomcat-9.0.86.tar/bin
    yum install java -y

    ./startup.sh
    EOF

    tags = {
        Name = "App-Server"
    }
}
