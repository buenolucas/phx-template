FROM ubuntu:18.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install asdf
ENV ASDF_DIR /usr/local/asdf
RUN apt-get update 
RUN apt-get install -y curl git
RUN git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.8.0
RUN source $ASDF_DIR/asdf.sh
RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
# Install Erlang via Erlang Solutions' .deb

# ENV ERLANG_VERSION="22.3.4"
# RUN apt-get update && sudo apt-get install -y --no-install-recommends \
# 		libodbc1 \
# 		libsctp1 \
# 		libwxgtk3.0 && \
# 	erlangDEB="https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_${ERLANG_VERSION}-1~ubuntu~bionic_amd64.deb" && \
# 	curl -sSL -o erlang.deb $erlangDEB && \
# 	dpkg -i erlang.deb && \
# 	rm -rf erlang.deb /var/lib/apt/lists/*

# # Install Elixir via Erlang Solutions' .deb
# ENV ELIXIR_VERSION=1.8.2
# RUN elixirDEB="https://packages.erlang-solutions.com/erlang/debian/pool/elixir_${ELIXIR_VERSION}-1~ubuntu~bionic_amd64.deb" && \
# 	curl -sSL -o elixir.deb $elixirDEB && \
# 	dpkg -i elixir.deb && \
# 	rm -rf elixir.deb && \
# 	elixir --version


# # Rust
# ENV RUST_VERSION=1.43.1
# RUN curl https://sh.rustup.rs | sh -s -- -y

# # NODEJS
# # Replace shell with bash so we can source files


# ENV NVM_DIR /usr/local/nvm
# ENV NODE_VERSION 10.15.3

# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
#   && source $NVM_DIR/nvm.sh \
#   && nvm install $NODE_VERSION \
#   && nvm alias default $NODE_VERSION \
#   && nvm use default

# ENV NODE_PATH $NVM_DIR/$NODE_VERSION/lib/node_modules
# ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

# # MySql
# ENV MYSQL_ROOT_PASSWORD=root
# ENV MYSQL_DATABASE=bookstore_test
# ENV MYSQL_USER: circleci
# ENV MYSQL_PASSWORD: circlec
# RUN sudo apt-get update
# RUN mysqlDEB=https://repo.mysql.com//mysql-apt-config_0.8.13-1_all.deb && \
#     curl -sSL -o mysql.deb $mysqlDEB && \
#     dpkg -i mysql.deb 

