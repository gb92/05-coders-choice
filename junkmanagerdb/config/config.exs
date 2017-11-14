# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :junkmanagerdb, ecto_repos: [Junkmanagerdb.Repo]

#configure Doorman authentication
config :doorman,
  repo: Junkmanagerdb.Repo,
  secure_with: Doorman.Auth.Bcrypt,
  user_module: Junkmanagerdb.User

import_config "#{Mix.env}.exs"
