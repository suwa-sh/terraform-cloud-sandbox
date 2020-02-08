variable "region" {
  type = "string"
  default = "ap-northeast-1"
}
variable "namespace" {
  type = "string"
  default = "tfcloud"
}
variable "stage" {
  type = "string"
  default = "prod"
}
variable "name" {
  type = "string"
  default = "sandbox"
}


variable "aws_access_key" {
  type = "string"
}
variable "aws_secret_key" {
  type = "string"
}
