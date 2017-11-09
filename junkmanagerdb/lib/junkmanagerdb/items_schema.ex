defmodule Junkmanagerdb.ItemsSchema do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "items" do
    field :name, :string
    field :description, :string
    field :purchase_price, :decimal
    field :sale_price

    timestamps()
  end

  def changeset(item, new_values) do
    item 
    |> cast(new_values, [:name, :description, :purchase_price, :sale_price])
    |>validate_required([:name, :description])
  end
end