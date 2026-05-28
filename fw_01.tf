# =========================================================================
# ARCHIVO 1: main.tf (Infraestructura Vulnerable - Grupo A)
# =========================================================================

# SECRETO COMPROMETIDO A
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

# MALA CONFIGURACIÓN IaC A
resource "aws_db_instance" "database_vulnerable_A" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "db_laboratorio_a"
  
  username             = "admin_alpha"
  password             = "PasswordAlfaSecret123!" 

  # Infracción Crítica de Red
  publicly_accessible  = true  
  skip_final_snapshot  = true
}


resource "aws_security_group" "allow_all" {
  name        = "allow_all_ssh"
  description = "Permitir trafico SSH entrante desde cualquier parte"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}