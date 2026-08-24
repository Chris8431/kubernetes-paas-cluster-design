FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Build context is the repo root (see devcontainer.json)
COPY scripts/install-tools.sh /tmp/install-tools.sh
RUN bash /tmp/install-tools.sh && rm /tmp/install-tools.sh

USER vscode
