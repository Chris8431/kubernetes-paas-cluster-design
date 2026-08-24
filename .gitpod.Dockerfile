FROM gitpod/workspace-full:latest

# Switch to root to run the shared tool installer
USER root
COPY scripts/install-tools.sh /tmp/install-tools.sh
RUN bash /tmp/install-tools.sh && rm /tmp/install-tools.sh

# Back to the gitpod user for environment setup
USER gitpod
ENV KUBECONFIG="/workspace/kubernetes-paas-cluster-design/kube-config.yaml"
