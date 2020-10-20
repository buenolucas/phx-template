FROM elixir:1.8.2

LABEL maintainer=" Arvore Dev <dev@arvore.com.br>"

ENV DEBIAN_FRONTEND=noninteractive

# COnfigure environment
RUN echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90arvore && \
    echo 'DPkg::Options "--force-confnew";' >> /etc/apt/apt.conf.d/90arvore && \
    apt-get update && apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

ENV PATH=/home/arvore/bin:/home/arvore/.local/bin:$PATH \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    ca-certificates \
    curl \
    git \
    gnupg \
    gzip \
    jq \
    # popular DB lib - MariaDB
    libmariadb-dev \
    # allows MySQL users to use MariaDB lib
    libmariadb-dev-compat \
    # popular DB lib - PostgreSQL
    libpq-dev \
    make \
    # for ssh-enabled builds
    nano \
    net-tools \
    netcat \
    openssh-client \
    parallel \
    software-properties-common \
    sudo \
    tar \
    tzdata \
    unzip \
    # for ssh-enabled builds
    vim \
    wget \
    zip && \
    rm -rf /var/lib/apt/lists/*
