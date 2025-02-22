ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-silverblue}"
FROM quay.io/fedora/fedora-${SOURCE_IMAGE}:${FEDORA_VERSION} AS base
RUN export FEDORA_VERSION=$( cat /etc/*-release | grep VERSION_ID | sed 's/\([A-Z_]\+=\)\([0-9]\+\)/\2/g' )

COPY usr /usr
WORKDIR /tmp/npm_workdir

RUN curl -L https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-${FEDORA_VERSION}/wezfurlong-wezterm-nightly-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/wezterm.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-${FEDORA_VERSION}/atim-starship-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/starship.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-${FEDORA_VERSION}/atim-lazygit-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/lazygit.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/zoxide/repo/fedora-${FEDORA_VERSION}/atim-zoxide-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/zoxide.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/gping/repo/fedora-${FEDORA_VERSION}/atim-gping-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/gping.copr.repo

RUN mkdir -p /tmp/docker_src
COPY src/* /tmp/docker_src/
RUN chmod -R +x /tmp/docker_src/*
RUN /tmp/docker_src/install-dependences.sh
RUN /tmp/docker_src/set-theme.sh
RUN /tmp/docker_src/set-fonts.sh

RUN systemctl enable waydroid-container

RUN wget https://raw.githubusercontent.com/ImperatorMarsa/dotfiles/base/bash/bashrc -O /tmp/bashrc_base && \
    cat /tmp/bashrc_base >> /etc/bashrc

RUN systemctl enable dconf-update.service

RUN rm -rf /var/lib/unbound \
    rm -rf /tmp/* \
    rm -rf /var

RUN ostree container commit
