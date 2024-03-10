
resource "aws_instance" "test_first" {
  ami             = "ami-03f4878755434977f"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]
  key_name        = "Sanjay"
  user_data       = data.template_file.web_userdata.rendered
  tags = {
    Name     = "Terraform_Img"
    Stage    = "Testing"
  }
}

data "template_file" "web_userdata" {
   template = file("dockerinstall.sh")
}
