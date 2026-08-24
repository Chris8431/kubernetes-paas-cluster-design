# Accompanying exercises for the Kubernetes PaaS Cluster Design course

[![Gitpod open-workspace](https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/Chris8431/kubernetes-paas-cluster-design)
[![Dev Container](https://img.shields.io/badge/Dev%20Container-open-blue?logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/Chris8431/kubernetes-paas-cluster-design)

This repository contains the accompanying practice tasks for the Kubernetes PaaS Cluster Design course.

To follow along the practice tasks, you have three options:

1. Install the following tools locally: kubectl, helm and a container engine like Docker
2. Use Gitpod with all tools pre-installed. Register and start [Gitpod](https://gitpod.io/#https://github.com/Chris8431/kubernetes-paas-cluster-design)
3. Use a [Dev Container](https://containers.dev/) with VS Code or any compatible editor. Open the repo and choose **Reopen in Container** – kubectl, helm and trivy are pre-installed automatically.

Please make sure to initialize your setup as explained in the initial mail.

## A note about PowerShell

Commands found in this repo were tested with PowerShell Core. You may have PowerShell Version 5 installed locally, which you can check with `$PSVersionTable`. In this case some commands, especially `curl`/`Invoke-WebRequest` behave quite different than `bash` or PowerShell Core. You may need to use wrapper such as `(Invoke-WebRequest <URL>).Content`.

## Additional tooling

> **Note:** If you are using the Dev Container or Gitpod, all tools are already pre-installed – you can skip this section.

In some practice tasks you need more tools (kubectl, helm, trivy). Start the utilities container from the repo root:

```bash
docker compose run --rm utilities
```

This pulls the pre-built image from the course registry, mounts `kube-config.yaml` as the active kubeconfig, and mounts the repository under `/code`. You will land in an interactive shell with all tools available.

To build the image locally instead (e.g. without registry access), run:

```bash
docker compose build utilities
docker compose run --rm utilities
```

## Structure

The following output of `tree -L 2` shows the folder structure of this repo:

```bash
.
├── LICENSE
├── Readme.md
├── docker-compose.yml      -> Starts the utilities container locally
├── scripts/
│   └── install-tools.sh   -> Shared tool installer (Gitpod & Dev Container)
├── .devcontainer/          -> Dev Container configuration
├── practice/               -> Practice tasks for each section
│   ├── identity
│   ├── monitoring
│   ├── resource-management
│   ├── security
│   └── traffic
└── tools/                  -> Used to build example images
    ├── demo-app
    ├── password
    └── scratch
```

## License

MIT: https://marcm.mit-license.org
