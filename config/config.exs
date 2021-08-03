# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pepe,
  ecto_repos: [Pepe.Repo]

# Configures the endpoint
config :pepe, PepeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wHKwHvL0XJRQe3mWKuGYFOUOqovr7J7NzeZrIUaZ/mJpTRaUuLBCbnzoNmOnAB+c",
  render_errors: [view: PepeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pepe.PubSub,
  live_view: [signing_salt: "RiBjpEBY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
