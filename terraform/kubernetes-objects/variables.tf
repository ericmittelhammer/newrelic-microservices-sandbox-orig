variable "cluster_name" {
  type = string
}

variable "new_relic_license_key" {
  type = string
}

variable "nginx_controller_http_nodeport" {
  type = string
  default = "30001"
}

variable "nginx_controller_https_nodeport" {
  type = string
  default = "30002"
}