provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
  git = {
    url = var.repository_url
  }
}
resource "flux/bootstrap_git" "this" {
  path = "fluxcd/clusters/sandbox"
}