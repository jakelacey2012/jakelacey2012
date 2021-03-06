use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :food_api, FoodApiWeb.Endpoint,
  http: [port: 4002],
  server: false

config :food_api, :service, FoodApi.MockService

# Print only warnings and errors during test
config :logger, level: :warn
