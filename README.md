
The `modules/vnet` folder contains a reusable Virtual Network module with `main.tf` defining resources, `variables.tf` for inputs, `outputs.tf` for outputs, and `locals.tf` for tagging and reusable values.

The `environments` folder separates configurations for `dev` and `prod`, each having `backend.tf` (remote state configuration) and `terraform.tfvars` (environment-specific values).

The root files (`main.tf`, `variables.tf`, `providers.tf`) define shared logic, inputs, and Azure provider configuration.

The `.github/workflows/terraform.yml` enables CI/CD for automated validation, planning, and deployment.
