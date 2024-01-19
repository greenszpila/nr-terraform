# GraphQL provider’s data function. 
# configure the GraphQL provider by specifying the API URL and the header “API-Key,” which is required to authenticate

provider "graphql" {
  url = "https://api.newrelic.com/graphql" #US data center API url EU API URL: api.eu.newrelic.com
  headers = {
    "API-Key" = (module.global_vars.nr_api_key)
  }
}
# graphql_query data function from the provider to query the New Relic GraphQL API
# specifying the account ID as a query variable and referencing the GraphQL query file you created earlier. 
data "graphql_query" "basic_query" {
  query_variables = { 
    accountId = (module.global_vars.nr_account_id)
  }
  query     = file("./getTopFiveApis.gql")
}

# Uncoment to see the output from the NRQL query
 output "response" {
     value = data.graphql_query.basic_query.query_response
 }

# This generates the 'rows' of widgets from the CONFIG object
# pass the result of the NRQL query into the CONFIG value of the templatefile() function 
# The jsondecode() function extracts the data we need from the results and assigns it to the CONFIG variable. 
locals {
  composed_render = templatefile(
               "${path.module}/../common/dashboards/nrql_composed_widgets.json.tftpl",
               {
                 ACCOUNTID = (module.global_vars.nr_account_id)
                 CONFIG = jsondecode(data.graphql_query.basic_query.query_response).data.actor.account.nrql.results
               }
        )
}

resource "newrelic_one_dashboard_json" "nrql_dashboard" {
   json = local.composed_render
}

#Lets tag terraform managed dashboards!
resource "newrelic_entity_tags" "nrql_dashboard" {
    guid = newrelic_one_dashboard_json.nrql_dashboard.guid
    tag {
        key = "terraform"
        values = [true]
    }
}

output "nrql_dashboard" {
  value=newrelic_one_dashboard_json.nrql_dashboard.permalink 
}