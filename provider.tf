module "global_vars" {
  source = "./common/variables"
}

# terraform config 
terraform {
  required_version = "~> 1.0"

  required_providers {
   #good practise is to pin to a tested provider version to avoid auto upgrades to the latest version, which might bring some unexpected surprises. 
   #version = "3.27.6"
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.27.6"
    }
    graphql = {
      source = "sullivtr/graphql"
      version = "2.5.2" 
    }
  }
}
# Import the variables 
# This sets the New Relic account ID, api_key and region for the provider. It is fetching the values from variables defined in the global_vars module.

provider "newrelic" {
  account_id = (module.global_vars.nr_account_id)
  api_key = (module.global_vars.nr_api_key)    # usually prefixed with 'NRAK'
  region = (module.global_vars.nr_region)      # Valid regions are US and EU
}