defmodule Junkmanagerdb.Impl do
  alias Junkmanagerdb.User
  alias Junkmanagerdb.ItemsSchema
  alias Junkmanagerdb.Repo
  alias Doorman.Auth.Secret

  import Ecto.Query

  def add(name, description) do
    %ItemsSchema{}
    |> ItemsSchema.changeset(%{name: name, description: description})
    |> Repo.insert!
  end

  def add(name, description, purchase_price) do
    %ItemsSchema{}
    |> ItemsSchema.changeset(%{name: name, description: description, purchase_price: purchase_price})
    |> Junkmanagerdb.Repo.insert!
  end

  def list_item_names() do
    from(item in ItemsSchema,
      select: [item.id, item.name],
      order_by: item.updated_at)  
    |> Repo.all
  end

  def find_item(id) do
    from(item in ItemsSchema, where: [id: ^id])
    |> Repo.one
  end

  def update_item(id, updates) do
    find_item(id)
    |> ItemsSchema.changeset(updates)
    |> Repo.update!
  end

  def add_user(username, email, password) do
    %User{}
    |> User.changeset(%{username: username, email: email, password: password})
    |> Secret.put_session_secret()
    |> Repo.insert
  end

  def auth_user(email, password) do
   Doorman.authenticate(email, password)
  end
  
end