# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :to_do,
  date_module: ToDo.MyDateImpl,
  ecto_repos: [ToDo.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :to_do, ToDoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IjcgVn46HMleAh247LXPIb7ZwpMtz+Fm/zDVQcSIR8ceqRyjDNt9r3hSQCegQr1M",
  render_errors: [view: ToDoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ToDo.PubSub,
  live_view: [signing_salt: "gMvZXm1J"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
config :to_do, ToDo.Repo, migration_primary_key: [type: :binary_id]
