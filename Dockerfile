FROM elixir

WORKDIR /app

RUN apt-get update && \
  apt-get install -y postgresql-client postgresql postgresql-contrib

RUN mix local.hex --force && mix archive.install hex phx_new --force && \
    echo y| mix phx.new beer_catalog --no-html --no-webpack --binary-id

RUN cd beer_catalog && mix deps.get && mix local.rebar --force

EXPOSE 4000

COPY files/seeds.exs /app/beer_catalog/priv/repo
COPY files/router.ex /app/beer_catalog/lib/beer_catalog_web
COPY entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
