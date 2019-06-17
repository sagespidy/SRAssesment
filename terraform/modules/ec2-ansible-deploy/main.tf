resource "aws_security_group" "nginx-sg" {
  name = "nginx-sg" 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my-test-instance" {
  ami             = "${data.aws_ami.centos.id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.nginx-sg.name}"]

  tags = {
    Name = "test-instance"
  }
    key_name = "test"
  
    # This is where we configure the instance with ansible-playbook
    provisioner "local-exec" {
        command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos --private-key test.pem -i '${aws_instance.my-test-instance.public_ip},' playbook.yml"
    }
}
