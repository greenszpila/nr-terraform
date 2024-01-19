
# Super simple to load in the JSON from file. Simply use the copy as JSON icon on the UI and paste into the basic.json file. 

# Note: This default dashboard JSON *will not display correctly* on your own account as the source JSON hard codes the account ID value.
# See dash_replace.tf for version that should work in your own account :)

# pass dashboard.json to the newrelic_one_dashboard_json resource.
resource "newrelic_one_dashboard_json" "basic_dashboard" {
   json = file("${path.module}/../common/dashboards/dashboard.json")
}

#Lets tag terraform managed dashboards!
resource "newrelic_entity_tags" "basic_dashboard" {
    guid = newrelic_one_dashboard_json.basic_dashboard.guid
    tag {
        key = "terraform"
        values = [true]
    }
}
#output the dashboard permalink to the console so it's easy to find.

output "basic_dashboard" {
  value=newrelic_one_dashboard_json.basic_dashboard.permalink 
}
