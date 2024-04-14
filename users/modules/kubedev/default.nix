{ pkgs, ...}: {
  # Install packages for doing dev work on kube clusters
  programs.k9s.enable = true;

  home.packages = with pkgs; [
    kubectl
    kubernetes-helm
    helm-dashboard
    fluxcd
    argocd
  ];
}
