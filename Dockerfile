FROM pulumi/pulumi

# Label things so it lights up in GitHub Actions!
# https://help.github.com/en/articles/metadata-syntax-for-github-actions
LABEL "com.github.actions.name"="AWS EKS with Kubeflow ML Platform with Identity"
LABEL "com.github.actions.description"="Deploy Kubeflow ML to Kubernetes on your favorite cloud using Pulumi"
LABEL "com.github.actions.icon"="unlock"
LABEL "com.github.actions.color"="red"
LABEL "repository"="https://github.com/ramene/pulumi-k8s-kubeflow"
LABEL "homepage"="https://hackmd.io/@ramene/SyZeCixLr"
LABEL "maintainer"="Ramene Anthony <keybase.io/ramene>"

# Copy the Pulumi infrastructure definition to a well-known location. Because the image
# will immediately begin running Pulumi commands, also switch the working directory.
COPY ./infra /infra

WORKDIR /infra

# GitHub Actions will mount the repo source code at this volume.
VOLUME [ "/app" ]

# Use the pulumify script as this container's entrypoint -- it will get the job done.
ENTRYPOINT [ "pulumify" ]