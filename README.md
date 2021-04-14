# Terraform multi-region multi-environment POC

Example Terraform code to build a simple Cloud Run service that lives in the GCP us-west1 region and the us-west4 region.

With one Terraform file per region, each file builds that regions Cloud Run service.  

The environments are then set by flagging the vars file:

* dev
* test
* stage
* production

## CLI for each environment

Development environment

```
terraform plan -var-file="dev-env.tfvars
```

Test environment

```
terraform plan -var-file="test-env.tfvars
```

Stage environment

```
terraform plan -var-file="stage-env.tfvars
```

Production environment

```
terraform plan -var-file="production-env.tfvars
```

## Terraform variable file documentation

### Variable Definitions (.tfvars) Files

To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with `-var-file`:

```
terraform apply -var-file="testing.tfvars"
```

Terraform also automatically loads a number of variable definitions files if they are present:

```
Files named exactly terraform.tfvars or terraform.tfvars.json.
Any files with names ending in .auto.tfvars or .auto.tfvars.json.
```
