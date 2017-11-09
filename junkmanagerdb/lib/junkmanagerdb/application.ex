defmodule Junkmanagerdb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # List all child processes to be supervised
    children = [
      worker(Junkmanagerdb.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Junkmanagerdb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
