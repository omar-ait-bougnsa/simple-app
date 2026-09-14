sudo kubectl create namespace argocd
sudo kubectl create namespace dev

sudo kubectl apply \
  -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml