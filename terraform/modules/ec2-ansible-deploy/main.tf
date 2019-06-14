resource "aws_instance" "my-test-instance" {
  ami             = "ami-02eac2c0129f6376b"
  instance_type   = "t2.micro"
}
