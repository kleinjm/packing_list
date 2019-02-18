# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :packing_list,
  ecto_repos: [PackingList.Repo]

# Configures the endpoint
config :packing_list, PackingListWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vAILz4xZwMPikl+r+pEqDDRIzLaX0gZUrQKJB2T6ktuYor8pv8Zs5NVa4TCeLRKP",
  render_errors: [view: PackingListWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PackingList.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :packing_list, PackingList.Guardian,
       issuer: "packing_list",
       secret_key: {:system, "PACKING_LIST_SECRET_KEY"}
