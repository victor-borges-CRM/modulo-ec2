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
