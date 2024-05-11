resource "null_resource" "schema" {

    depends_on = [ aws_docdb_cluster.docdb , aws_docdb_cluster_instance.cluster_instances ]
  # Establishes connection to be used by all
  provisioner "local-exec" {
    command = <<EOF
    
    cd /tmp
    curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip
    unzip mongodb.zip
    cd mongodb-main
    wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
    mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint} --sslCAFile global-bundle.pem --username admin1 --password RoboShop1 < catalogue.js
    mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint} --sslCAFile global-bundle.pem --username admin1 --password RoboShop1 < users.js
    EOF
  }
}