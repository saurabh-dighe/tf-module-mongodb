resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "roboshop-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "RoboShop1"
  # backup_retention_period = 5                 Enable in prod
  # preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}

resource "aws_docdb_subnet_group" "docdb" {
  name       = "robosho-${var.ENV}-subent-grp"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID

  tags = {
    Name = "robosho-${var.ENV}-subent-grp"
  }
}