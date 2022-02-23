variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.21"
}

variable "target_group_http_port" {
  type = string
  default = "30001"
}

variable "target_group_https_port" {
  type = string
  default = "30002"
}
