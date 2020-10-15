FROM elixir:1.8.2

ENV NODE_VERSION 10.15.3
RUN apt-get update && \
    apt-get install -y mysql-client && \
    apt-get install -y inotify-tools && \
	curl -L -o node.tar.xz "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" && \
	sudo tar -xJf node.tar.xz -C /usr/local --strip-components=1 && \
	sudo ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME