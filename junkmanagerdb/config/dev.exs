use Mix.Config

config(:junkmanagerdb, Junkmanagerdb.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "junkmanager_#{Mix.env}",
  username: "gavinb",
  password: "",
  hostname: "localhost")