defmodule Junkmanagerdb.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Doorman.Auth.Bcrypt, only: [hash_password: 1]

  schema "users" do
    field :username, :string
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true
    field :session_secret, :string

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user 
    |> cast(params,  [ :username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 8)
    |> hash_password
  end
end