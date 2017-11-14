# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :junkmanager, JunkmanagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m1Ac3xyll6tJYL0feR/OOzHNzdiPkisTjLUCUyd0cz8zGmgaB5Q50/1Z7M2IPPxJ",
  render_errors: [view: JunkmanagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Junkmanager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

#configure Doorman authentication
config :doorman,
  repo: Junkmanagerdb.Repo,
  secure_with: Doorman.Auth.Bcrypt,
  user_module: Junkmanagerdb.User

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "../../junkmanagerdb/config/#{Mix.env}.exs"