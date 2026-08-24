# Security Task 2 - Scan manifests

**Hint**: If you do not have trivy installed, run the following command from the repo root to start a container with trivy and kubectl pre-installed (the kubeconfig is picked up automatically):

```bash
docker compose run --rm utilities
```

Create the manifests provided in `manifests.yaml` in your cluster via `kubectl apply -f manifests.yaml`.

Go on and use trivy to scan the manifests. You can find a few deployments inside the `task-2` namespace.

Identify webservers that have misconfigurations.

You will need the `kubernetes` subcommand to scan the manifests: `trivy kubernetes --help`

**Hint**: We are using the [static web server image](https://github.com/static-web-server/static-web-server) as it is very lightweight and simple to use. But for this task it is not relevant as we concentrate on the manifests.
