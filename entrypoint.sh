#!/bin/bash
set -euo pipefail

cd /app/beer_catalog && sed -i 's/username: "postgres",/username: "elixir",/' config/*.exs
cd /app/beer_catalog && sed -i 's/password: "postgres",/username: "Barcelona2021#",/' config/*.exs
cd /app/beer_catalog && sed -i 's/hostname: "localhost",/hostname: "'"$ENDPOINT"'",/' config/*.exs

cd /app/beer_catalog && mix ecto.create
cd /app/beer_catalog && mix phx.gen.context Catalog Beer beers brand:string style:string origin:string quantity:integer
cd /app/beer_catalog && mix ecto.migrate
cd /app/beer_catalog && mix run priv/repo/seeds.exs
cd /app/beer_catalog && echo Y | mix phx.gen.json Catalog Beer beers brand:string style:string origin:string quantity:integer --no-context --no-schema
cd /app/beer_catalog && mix phx.server
