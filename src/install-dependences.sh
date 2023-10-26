#! /bin/bash

# Shell Extensions
rpm-ostree install \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-system-monitor-applet \
    gnome-shell-extension-gpaste \
    gnome-shell-extension-bubblemail \
    gnome-shell-extension-forge \
    gnome-shell-extension-freon

# pop theme
rpm-ostree install \
    pop-gnome-shell-theme \
    pop-gtk2-theme \
    pop-gtk3-theme \
    pop-gtk4-theme \
    pop-icon-theme \
    pop-sound-theme

# Fonts
rpm-ostree install \
    jetbrains-mono-fonts \
    jetbrains-mono-nl-fonts \
    jetbrains-mono-fonts-all

# Other
rpm-ostree install \
    btop \
    fish \
    gpaste \
    gpaste-ui \
    gnome-tweaks \
    bubblemail \
    podman \
    NetworkManager-libnm-devel \
    gnome-system-monitor \
    ripgrep \
    libgtop2-devel \
    lm_sensors \
    starship \
    tmux \
    vim \
    wezterm \
    zoxide
