## Getting Started guide 
- https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/guides/getting_started.html 
- https://github.com/newrelic/observability-as-code
  
## DevRel workshop: 
- https://newrelic.com/blog/how-to-relic/examples-observability-as-code-part-one
- https://github.com/ntcsteve/O11yAsCodeWithNR 
- https://play.instruqt.com/newrelic/invite/wcxyo2ld0b3g 

## Blogs: 
Dashboards 1.1-1.4 workshops have been inspired by these blog articles:
- https://newrelic.com/blog/how-to-relic/create-nr-dashboards-with-terraform-part-1
- https://newrelic.com/blog/how-to-relic/create-nr-dashboards-with-terraform-part-2 
- https://newrelic.com/blog/how-to-relic/create-nr-dashboards-with-terraform-part-3
  
## Pre requisities 
- New Relic account
- Terraform configured
- To create New Relic dashboards in Terraform using JSON templates, you need to be using newrelic terraform provider version 3.4.0 or above.

## Steps 

1. Get ready with your API key and account ID 
2. Add API key and the account ID in the getting-started/common/variables/variables.tf 
3. Make sure that the APM service name matches with the APM service deployed in NR.
4. `terraform init` to initialize newrelic terraform provider
5. `terraform plan` `terraform apply` to create your first resource - an Alert Policy
6. Verify in the new relic UI 
7. Uncomment NRQL Alert Condition section and run `terraform apply` to add Alert Condition to the existing Policy. 
8. `terraform destroy` 
9. Continue workshop in each directory from 1.0 upwards. It's basically `terraform init`, `terraform apply` and `terraform destroy`