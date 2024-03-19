resource "aws_instance" "J-Server" {
  instance_type = "t2.micro"
  ami= "ami-08116b9957a259459" #ubuntu Server
  subnet_id = "subnet-00feea2234ce14160"
  security_groups = [ var.all-allowed-sg ]
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install openjdk-11-jdk -no

    apt-get install -y maven git
    EOF
}
