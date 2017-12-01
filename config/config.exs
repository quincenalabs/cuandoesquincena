# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cuandoesquincena,
  ecto_repos: [Cuandoesquincena.Repo]

# Configures the endpoint
config :cuandoesquincena, Cuandoesquincena.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nfjz7WMWI1avXk3Q0URGMd8gcNtQpc/ZV4P4bOkquTYTz877z/b8JlCvdwWeoZyr",
  render_errors: [view: Cuandoesquincena.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cuandoesquincena.PubSub,
     adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :logger,
  backends: [Rollbax.Logger]

# We configure the Rollbax.Logger backend.
config :logger, Rollbax.Logger,
  level: :error

# IMPORT environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :rollbax,
  access_token: "b1c0c60e4aef43e4a9bdefe521ba18b7",
  environment: "production"
