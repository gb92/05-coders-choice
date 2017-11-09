defmodule Junkmanagerdb.Impl do
  alias Junkmanagerdb.ItemsSchema
  alias Junkmanagerdb.Repo

  import Ecto.Query

  def add(name, description) do
    %ItemsSchema{}
    |> ItemsSchema.changeset(%{name: name, description: description})
    |> Junkmanagerdb.Repo.insert!
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
end