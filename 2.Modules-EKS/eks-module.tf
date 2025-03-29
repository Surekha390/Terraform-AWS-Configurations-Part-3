#Don't apply it, so many resources will be created which leads to so much cost.
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.34.0"
  subnet_ids = ["subnet-01207f027c76b0279"]
  cluster_name = "test"
}

#For some modules, it is necessary to add some inputs by us like subnet id,name etc.