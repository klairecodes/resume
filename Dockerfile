#FROM archlinux:base-devel-20231112.0.191179 as build-env
FROM docker.io/kjarosh/latex as build-env

RUN ["apk", "add", "make"]

## Initial Arch Linux image setup
#RUN ["pacman", "--noconfirm", "-Sy", "archlinux-keyring"]
#RUN ["pacman-key", "--init"]
#RUN ["pacman-key", "--populate"]
#RUN ["pacman", "--noconfirm", "-Syu"]

## Base build dependencies
#RUN ["pacman", "-S", "--noconfirm", "--needed", "base-devel", "git"]
#RUN ["pacman", "--noconfirm", "-S", "texlive"]
#RUN ["pacman", "--noconfirm", "-S", "perl-yaml-tiny"]
#RUN ["pacman", "--noconfirm", "-S", "perl-file-homedir"]

## Fonts
#RUN ["pacman", "--noconfirm", "-S", "noto-fonts-emoji"]
#RUN ["pacman", "--noconfirm", "-S", "ttf-font-awesome"]
## AUR
#RUN ["git", "clone", "https://aur.archlinux.org/texlive-fonts-fontawesome.git"]
#WORKDIR ./texlive-fonts-fontawesome
#RUN ["cd", "texlive-fonts-fontawesome"] # does not work because of folder permissions
#RUN ["pacman", "-U", "package_name-version-architecture.pkg.tar.zst"]


FROM build-env

WORKDIR /src
COPY . /src

CMD ["make"]
