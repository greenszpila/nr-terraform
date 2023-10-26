# data source to get information about a specific entity in New Relic that already exists. 
data "newrelic_entity" "myapp" {
  # Note: This must be an exact match of your app name in New Relic (Case sensitive)
  name = (module.global_vars.nr_appname) 
  type = "APPLICATION"
  domain = "APM"
}

# resource to create, update, and delete tags for a New Relic entity.
resource "newrelic_entity_tags" "myapp" {
    guid = data.newrelic_entity.myapp.guid

    # A nested block that describes an entity tag
    tag {
        key = "O11yAsCode"
        values = ["Hashicorp", "Terraform", "HCL"]
    }

    tag {
        key = "Workloads"
        values = ["Relicstaurants-SRE"]
    }
}