resource "newrelic_synthetics_private_location" "location" {
  description               = "Example private location"
  name                      = "private K8s test"
  verified_script_execution = false
}

resource "newrelic_synthetics_monitor" "monitor" {
  status            = "ENABLED"
  type              = "BROWSER"
  uri               = "https://www.example.com"
  name              = "monitor_private_tf"
  period            = "EVERY_MINUTE"
  locations_private = ["MzczNTY4NHxTWU5USHxQUklWQVRFX0xPQ0FUSU9OfDc1M2Q0YzAxLTUwODEtNDU1Mi04MGU4LWUzZjg3MTc0ZWNjOQ"]

  custom_header {
    name  = "krs_tf"
    value = "tf_sjm_test"
  }

  enable_screenshot_on_failure_and_script = true
  validation_string                       = "domain"
  verify_ssl                              = true
  runtime_type_version                    = "100"
  runtime_type                            = "CHROME_BROWSER"
  script_language                         = "JAVASCRIPT"

  tag {
    key    = "synthetics_tf_sjm"
    values = ["tf-private"]
  }
}