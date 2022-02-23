resource "kubernetes_namespace" "ingress_nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress_nginx" {

  namespace  = kubernetes_namespace.ingress_nginx.metadata[0].name
  wait       = true
  timeout    = 600

  name       = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
   ## type: NodePort
    ## nodePorts:
    ##   http: 32080
    ##   https: 32443
  set {
    name = "controller.kind"
    value = "DaemonSet"
  }
  
  set {
    name = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
  
  set {
    name = "controller.service.type"
    value = "NodePort"
  }
  
   set {
    name = "controller.service.nodePorts.http"
    value = var.nginx_controller_http_nodeport
  }
  
  set {
    name = "controller.service.nodePorts.https"
    value = var.nginx_controller_https_nodeport
  }
  
}