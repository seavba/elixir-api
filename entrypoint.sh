#!/bin/bash
set -euo pipefail

cd /app/beer_catalog && sed -i 's/username: "postgres",/username: "elixir",/' config/*.exs
cd /app/beer_catalog && sed -i 's/password: "postgres",/username: "Barcelona2021#",/' config/*.exs
sed -i 's/hostname: "localhost",/hostname: "elixir.cauwadl2xq0q.eu-west-1.rds.amazonaws.com",/' config/*.exs
cd /app/beer_catalog && mix phx.server
