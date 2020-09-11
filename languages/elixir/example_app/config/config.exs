# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :example_app,
  ecto_repos: [ExampleApp.Repo]

# Configures the endpoint
config :example_app, ExampleAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gCnnVrtUS+68lEmSbd4a1qBJ0tPcfF90qqBZ8r2Knp73+v8Zi3cXutH4U4pdjMaT",
  render_errors: [view: ExampleAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ExampleApp.PubSub,
  live_view: [signing_salt: "MpFRNGzg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
