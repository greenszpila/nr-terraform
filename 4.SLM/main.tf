resource "newrelic_service_level" "my_synthetic_monitor_service_level" {
    guid = "MzczNTY4NHxTWU5USHxNT05JVE9SfGZhNGE1MDE5LTI4OWEtNDhiZi1hYTNmLWUwMzU0ZTYxNTkyOA"
    name = "My synthethic monitor - Success"
    description = "Proportion of successful synthetic checks."

    events {
        account_id = 4210328
        valid_events {
            from = "SyntheticCheck"
            where = "entityGuid = 'MzczNTY4NHxTWU5USHxNT05JVE9SfGZhNGE1MDE5LTI4OWEtNDhiZi1hYTNmLWUwMzU0ZTYxNTkyOA'"
        }
        good_events {
            from = "SyntheticCheck"
            where = "entityGuid = 'MzczNTY4NHxTWU5USHxNT05JVE9SfGZhNGE1MDE5LTI4OWEtNDhiZi1hYTNmLWUwMzU0ZTYxNTkyOA' AND result='SUCCESS'"
        }
    }

    objective {
        target = 99.00
        time_window {
            rolling {
                count = 7
                unit = "DAY"
            }
        }
    }
}

resource "newrelic_entity_tags" "my_synthetic_monitor_service_level_tags" {
  guid = newrelic_service_level.my_synthetic_monitor_service_level.sli_guid

   tag {
        key = "user_journey"
        values = ["authentication", "sso"]
    }

    tag {
        key = "owner"
        values = ["identityTeam"]
    }
}