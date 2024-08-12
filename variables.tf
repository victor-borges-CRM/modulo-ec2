#VPC
variable "vpc_id" {
  type        = string
  default     = "Default_TF"
  description = "ID da VPC padrão da CRMBonus"
}

#EC2
variable "tipo_instancia" {
  type        = string
  default     = "Default_TF"
  description = "Tipo de maquina"
}

variable "nome" {
  type        = string
  default     = "Default_TF"
  description = "Nome da máquina"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = ["Default_TF"]
  description = "ID do grupo de seguranca"
}

variable "iam_instance_profile" {
  type        = string
  default     = "Default-TF"
  description = "Perfil da instancia para associar a uma role"
}


