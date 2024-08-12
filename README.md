# modulo-ec2
Repositório destinado ao recurso EC2 da AWS 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_vpc.vpc_padrao](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | Perfil da instancia para associar a uma role | `string` | `"Default-TF"` | no |
| <a name="input_nome"></a> [nome](#input\_nome) | Nome da máquina | `string` | `"Default_TF"` | no |
| <a name="input_tipo_instancia"></a> [tipo\_instancia](#input\_tipo\_instancia) | Tipo de maquina | `string` | `"Default_TF"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID da VPC padrão da CRMBonus | `string` | `"Default_TF"` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | ID do grupo de seguranca | `list(string)` | <pre>[<br>  "Default_TF"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->