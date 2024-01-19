module "global_vars" {
  source = "../common/variables"
}

# terraform config 
terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
    graphql = {
      source = "sullivtr/graphql"
      version = "2.5.2" 
    }
  }
}

provider "newrelic" {
  account_id = (module.global_vars.nr_account_id_dev)
  api_key = (module.global_vars.nr_api_key)    # usually prefixed with 'NRAK'
  region = (module.global_vars.nr_region)      # Valid regions are US and EU
}
# you will get prompted at terraform apply to type the account ID number as the value is not provided here, only data type.
variable "accountId" { type = string }
