resource "aws_key_pair" "nouman" {
    key_name = var.key_name
    public_key = file(var.public_key_path)
  
}

resource "aws_instance" "jenkins_app" {
    ami = var.ami 
    instance_type = var.instance_type
    subnet_id =  var.subnet_id
    security_groups = var.security_group_ids
    key_name = var.key_name

    user_data = var.user_data

    lifecycle {
      ignore_changes =  all
    }
      
}