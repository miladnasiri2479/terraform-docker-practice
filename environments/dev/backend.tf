# backend.tf - Remote State Simulation

# Dar yek proje production-e vaghei, ma hichvaght state ro local negah nemidarim.
# Inja ye nemoone az backend-e S3 ro comment kardam ke befahmi chetori state-ha joda mishan.

/*
terraform {
  backend "s3" {
    bucket         = "my-company-terraform-state"
    key            = "environments/dev/terraform.tfstate" # Masire joda baraye har env
    region         = "us-east-1"
    dynamodb_table = "terraform-lock" # Baraye jologiri az hamzamani (State Locking)
  }
}
*/

# Baraye alan ke local hastim, Terraform be sorate pishfarz az "local" backend estefade mikone
# vali tu hamin folder-e 'dev' zakhireesh mikone ke ba 'prod' ghati nashe.
