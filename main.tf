# 2.Data Source

data "newrelic_entity" "app_name" {
  //name = "Relicstaurants2" # Note: This must be an exact match of your app name in New Relic (Case sensitive)
  name = "r-restaurantService"
  type = "APPLICATION"
  domain = "APM"
}

resource "newrelic_alert_policy" "alert_policy_name" {
  name = "[oac-demo]relicstaurantService"
}

// run terraform apply to apply the Alert Policy, then uncomment the below and apply the AC.
/*
# 3.NRQL alert condition
resource "newrelic_nrql_alert_condition" "oac-demo-relicstaurant-alertCondition" {
  policy_id                    = newrelic_alert_policy.alert_policy_name.id
  type                         = "static"
  name                         = "oac-demo-relicstaurant-alertCondition"
  description                  = "Alert when transactions are taking too long"
  runbook_url                  = "https://www.example.com"
  enabled                      = true
  violation_time_limit_seconds = 3600

  nrql {
    query             = "SELECT average(duration) FROM Transaction where appName = '${data.newrelic_entity.app_name.name}'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}
*/