#!/usr/bin/env bash
# Shared tool installation script for Gitpod and DevContainer.
# Must be run as root (no sudo).
set -euo pipefail

ARCH="$(dpkg --print-architecture)"

apt-get update
apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg \
    lsb-release \
    bash-completion

# --- kubectl (latest stable, or pin via KUBECTL_VERSION) ---
KUBECTL_VERSION="${KUBECTL_VERSION:-$(curl -fsSL https://dl.k8s.io/release/stable.txt)}"
curl -fsSLO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# --- Helm (latest) ---
curl -fsSL "https://get.helm.sh/helm-$(curl -fsSL https://get.helm.sh/helm-latest-version)-linux-${ARCH}.tar.gz" \
    | tar -xz -C /tmp
install -o root -g root -m 0755 "/tmp/linux-${ARCH}/helm" /usr/local/bin/helm
rm -rf "/tmp/linux-${ARCH}"

# --- Trivy ---
wget -qO - https://get.trivy.dev/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://get.trivy.dev/deb generic main" \
    | tee /etc/apt/sources.list.d/trivy.list
apt-get update
apt-get install -y trivy

apt-get clean && rm -rf /var/lib/apt/lists/*
