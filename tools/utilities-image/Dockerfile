FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

COPY .bashrc /root/.bashrc

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl wget apt-transport-https gnupg lsb-release bash-completion && \
    wget -qO - https://get.trivy.dev/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://get.trivy.dev/deb generic main" | tee /etc/apt/sources.list.d/trivy.list && \
    ARCH="$(dpkg --print-architecture)" && \
    curl -fsSLO "https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm -f kubectl && \
    curl -fsSL "https://get.helm.sh/helm-$(curl -fsSL https://get.helm.sh/helm-latest-version)-linux-${ARCH}.tar.gz" | tar -xz -C /tmp && \
    install -o root -g root -m 0755 "/tmp/linux-${ARCH}/helm" /usr/local/bin/helm && \
    rm -rf "/tmp/linux-${ARCH}" && \
    apt-get update && \
    apt-get install -y --no-install-recommends trivy && \
    rm -rf /var/lib/apt/lists/* && \
    kubectl completion bash >> /root/.bashrc && \
    trivy completion bash >> /root/.bashrc