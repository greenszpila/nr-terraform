resource "newrelic_alert_policy" "main" {
  name                = "[oac-demo]Basic Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

// This is the bare minimum configuration required
module "main" {
  source = "usfoods/nrql-alert-condition/newrelic"

  account_id = (module.global_vars.nr_account_id)
  policy_id  = newrelic_alert_policy.main.id
  name       = "Basic Critical NRQL Alert Condition"
  enabled    = true 

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 1000
    threshold_duration = 180
  }
}