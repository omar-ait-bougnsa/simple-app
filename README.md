# simple-app

Simple Node.js/Express app used as an ArgoCD demo.
 
## What's already here
- `Dockerfile` — builds the app image
- `deployment.yaml` — Kubernetes Deployment (image: `simple-app:v1`, `imagePullPolicy: Never`)
- `index.js` / `package.json` — Express app listening on port 3000

## Still needed for ArgoCD

1. **Service** — no k8s Service manifest yet to expose port 3000 inside the cluster (e.g. `service.yaml` of type ClusterIP/NodePort).
2. **Namespace** (optional but common) — a manifest or `kubectl create ns` for where the app will live.
3. **Push this repo to GitHub** — ArgoCD needs a git URL to sync from. Files are currently untracked/uncommitted locally.
4. **ArgoCD Application manifest** — the CRD that tells ArgoCD what repo/path/branch to watch and which cluster/namespace to deploy into (`kind: Application`, `spec.source.repoURL`, `spec.source.path`, `spec.destination`).
5. **Image availability** — deployment uses `imagePullPolicy: Never` with `image: simple-app:v1`, so the image must already exist on the cluster's nodes (e.g. built directly into a local kind/minikube cluster). A real registry + tag bump (CI or Image Updater) would be needed for real deploys, but not required for a simple demo.
6. **ArgoCD itself installed** — confirm ArgoCD is running in the cluster (namespace `argocd`, CLI/UI access).
7. **kustomization.yaml or plain manifests folder** — plain manifests (`deployment.yaml` + `service.yaml`) are enough for "simple," no Helm/Kustomize required.
