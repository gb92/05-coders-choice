defmodule Junkmanagerdb.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table :users do
      add :username, :string
      add :email, :string
      add :hashed_password, :string
      add :session_secret, :string
      timestamps()
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
