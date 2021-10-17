output "instance_public_ip" {
  description	= "The public IP for ssh access"
  value		= "${aws_instance.app_server.public_ip}"
}

# ---

output "elasticache_hostname" {
  description	= "Elasticache instance hostname"
  value		= aws_elasticache_cluster.hello.cache_nodes.0.address
  sensitive	= false
}

# ---

output "rds_hostname" {
  description	= "RDS instance hostname"
  value		= aws_db_instance.hello.address
  sensitive	= false
}

output "rds_port" {
  description	= "RDS instance port"
  value		= aws_db_instance.hello.port
  sensitive	= false
}

output "rds_username" {
  description	= "RDS instance root username"
  value		= aws_db_instance.hello.username
  sensitive	= false
}

# ---

output "script_output_log_file" {
  description 	= "server_setup.sh output log file"
  value 	= "sudo cat /var/log/cloud-init-output.log" 
  sensitive	= false
}

output "EC2_instance_login_info" {
  description 	= "how to log into new ec2 instance"
  value 	= "ssh -i ~/dockerdave00_aws_instance_keypair.pem ec2-user@${aws_instance.app_server.public_ip}" 
  sensitive	= false
}

# ---

output "psql_login_info" {
  description 	= "how to log into rds database with psql"
  value 	= "psql --host=${aws_db_instance.hello.address} --port=${aws_db_instance.hello.port} --username=${aws_db_instance.hello.username}" 
  sensitive	= false
}
# small change to trigger version control
