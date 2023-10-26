# Getting Started guide 
- https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/guides/getting_started.html 
- https://github.com/newrelic/observability-as-code
  
# DevRel workshop: 
- https://newrelic.com/blog/how-to-relic/examples-observability-as-code-part-one
- https://github.com/ntcsteve/O11yAsCodeWithNR 
- https://play.instruqt.com/newrelic/invite/wcxyo2ld0b3g 

# Pre requisities 


# Steps 

1. Get ready with your API key and account ID 
2. Add API key and the account ID in the getting-started/common/variables/variables.tf 
3. Make sure that the APM service name matches with the APM service deployed in NR.
4. `terraform init` to initiallize newrelic terraform provider
5. `terraform plan` `terraform apply` to create your first resource - an Alert Policy
6. Veryfi in the new relic UI 
7. Uncomment NRQL Alert Condition section and run `terraform apply` to add Alert Condition to the existing Policy. 