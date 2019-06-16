resource "aws_instance" "my-test-instance" {
  ami             = "${data.aws_ami.centos.id}"
  instance_type   = "t2.micro"

  tags = {
    Name = "test-instance"
  }

    security_group_ids = ["${aws_security_group.test-instance.id}"]
    associate_public_ip_address = true

    # We're assuming there's a key with this name already
    key_name = "AdminSSH"

    # This is where we configure the instance with ansible-playbook
    provisioner "local-exec" {
        command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos --private-key ./AdminSSH.pem -i '${aws_instance.test-instance.public_ip},' playbook.yml"
    }
}
