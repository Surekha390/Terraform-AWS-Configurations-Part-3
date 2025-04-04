terraform { 
  cloud { 
    
    organization = "surekha-hcp-organization" 

    workspaces { 
      name = "cli-deriven-workflow" 
    } 
  } 
}

resource "time_sleep" "wait_30_seconds" {
  create_duration = "30s"
}

#
/*
commands:
   2 terraform init
   3 terraform apply -auto-approve
   4 terraform login
   5 terraform init
   6 terraform plan
   7 terraform version
   */