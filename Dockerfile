FROM elixir:1.3.2
ENV DEBIAN_FRONTEND=noninteractive
ENV MIX_ENV=prod
ENV PORT=80
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
    RUN apt-get install -y -q nodejs
WORKDIR /app
ADD . /app

RUN MIX_ENV=prod mix deps.get
RUN npm install
RUN ./node_modules/brunch/bin/brunch  build --production
RUN MIX_ENV=prod mix phoenix.digest
RUN MIX_ENV=prod mix compile
