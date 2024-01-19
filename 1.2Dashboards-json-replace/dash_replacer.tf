
# Here we demonstrate using replace() to change the dashboard name and set the account ID from the source file to the accountId variable supplied

resource "newrelic_one_dashboard_json" "replacer_dashboard" {
   json = replace(
      replace(
         #file("../common/dashboards/composed_widgets.json"), #use it at the start of 1.3 demo to explain that we are multiplying the AWS row with widgets to all cloud providers
        file("../common/dashboards/dashboard.json"),
        "by Terraform"
        ,"renamed by Terraform"
      ),
    "3491187",      # This is the hard coded value in the source file
    module.global_vars.nr_account_id_dev   # This is the value to change that hard coded value to, basically my dev account
    )
}

#Lets tag terraform managed dashboards!
resource "newrelic_entity_tags" "replacer_dashboard" {
    guid = newrelic_one_dashboard_json.replacer_dashboard.guid
    tag {
        key = "terraform"
        values = [true]
    }
}

output "replacer_dashboard" {
  value=newrelic_one_dashboard_json.replacer_dashboard.permalink 
}
