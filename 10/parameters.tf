locals {
  my_parameters = [
    {
      "prefix" = "/myprefix"
      "parameters" = [
        {
          "name"  = "myparameter"
          "value" = "myvalue"
        },
        {
          "name"  = "environment"
          "value" = "dev"
        }
      ]
    },
    {
      "prefix" = "/myapp"
      "parameters" = [
        {
          "name"  = "environment"
          "value" = "prod"
        }
      ]      
    }
  ]
}

module "parameters" {
  parameters = local.my_parameters
  source     = "./ssm-parameter"
}

output "all-my-parameters" {
  value = { for k, parameter in module.parameters : k => parameter.arn }
}
