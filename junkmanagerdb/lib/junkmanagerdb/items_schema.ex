defmodule Junkmanagerdb.ItemsSchema do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "items" do
    field :name, :string
    field :description, :string
    field :purchase_price, :float
    field :sale_price, :float
    
    belongs_to :user, Junkmanagerdb.User

    timestamps()
  end

  def changeset(item, new_values) do
    item 
    |> cast(new_values, [:name, :description, :user_id, :purchase_price, :sale_price])
    |> validate_required([:name, :user_id, :description])
  end
end