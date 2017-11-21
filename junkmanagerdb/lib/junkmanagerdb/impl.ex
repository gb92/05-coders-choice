defmodule Junkmanagerdb.Impl do
  alias Junkmanagerdb.User
  alias Junkmanagerdb.ItemsSchema
  alias Junkmanagerdb.Repo
  alias Doorman.Auth.Secret

  import Ecto.Query

  def add(name, description, user_id) do
    %ItemsSchema{}
    |> ItemsSchema.changeset(%{name: name, description: description, user_id: user_id})
    |> Repo.insert!
  end

  def add(name, description, user_id, purchase_price) do
    %ItemsSchema{}
    |> ItemsSchema.changeset(%{name: name, description: description, purchase_price: purchase_price, user_id: user_id})
    |> Junkmanagerdb.Repo.insert!
  end

  def list_item_names() do
    from(item in ItemsSchema,
      select: [item.id, item.name],
      order_by: item.updated_at)  
    |> Repo.all
  end

  def list_items() do
    from(item in ItemsSchema,
      select: [item.id, item.name, item.purchase_price, item.sale_price],
      order_by: item.updated_at)
    |> Repo.all
  end

  def list_items_for_user(user_id) do
    from(item in ItemsSchema,
      select: [item.id, item.name, item.purchase_price, item.sale_price],
      where: [user_id: ^user_id],
      order_by: [desc: item.updated_at])
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