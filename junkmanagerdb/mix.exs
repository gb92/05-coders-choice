defmodule Junkmanagerdb.Mixfile do
  use Mix.Project

  def project do
    [
      app: :junkmanagerdb,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Junkmanagerdb.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :postgrex, ">= 0.0.0"},
      { :ecto, ">=0.0.0"},
      {:doorman, path: "../doorman/"}
    ]
  end
end
