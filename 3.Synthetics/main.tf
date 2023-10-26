// from https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_script_monitor#additional-examples

resource "newrelic_synthetics_script_monitor" "monitor" {
  status           = "ENABLED"
  name             = "script_monitor"
  type             = "SCRIPT_BROWSER"
  locations_public = ["EU_WEST_1", "AP_EAST_1"]
  period           = "EVERY_HOUR"

  enable_screenshot_on_failure_and_script = false

  //script = "$browser.get('https://one.newrelic.com')"
  script = file("./example.js")

  runtime_type_version = "100"
  runtime_type         = "CHROME_BROWSER"
  script_language      = "JAVASCRIPT"

  tag {
    key    = "synthetics-browser"
    values = ["terraform"]
  }
}


/* from NR AI GROK
resource "newrelic_synthetics_monitor" "example" {
  name      = "Example monitor"
  type      = "SCRIPT_BROWSER"
  frequency = 5
  status    = "ENABLED"
  locations = ["AWS_US_EAST_1", "AWS_US_WEST_1"]

  uri                       = "https://example.com"
  validation_string         = "Welcome to Example"
  verify_ssl                = true
  bypass_head_request       = true
  treat_redirect_as_failure = false
}

resource "newrelic_synthetics_monitor_script" "example" {
  monitor_id = newrelic_synthetics_monitor.example.id

  text = <<-EOT
    var assert = require('assert');
    $browser.get('https://example.com').then(function() {
      return $browser.findElement($driver.By.tagName('h1')).getText();
    }).then(function(headerText) {
      assert.equal(headerText, 'Welcome to Example');
    });
  EOT
}
*/