/*
variable "password" {
    default = "SuperSecretPassword!!!"  #It will not show this password in CLI, but we can see this password in state file.
    sensitive = "true"
}

resource "local_file" "foo" {
  content  = var.password
  filename = "${path.module}/password.txt"
}
*/
resource "local_sensitive_file" "foo" {
  content  = "SuperSecretPassword!!!"
  filename = "${path.module}/password.txt"
}
/*
output "pass" {
    value = local_sensitive_file.foo.content
    sensitive = "true" #if we don't give this line, this will throw error, as our resource is sensitive. It will not show output in our CLI, but it will 
    #show output in state file outputs section, which can be used by some other module. Aim of sensitive parameter is to protect CLI output and logs.
}
*/

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz" #AWS won't show this database password by default. It shows the password value as sensitive.
  #AWS provider plugin has the appropriate logic to achieve this for RDS.
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}