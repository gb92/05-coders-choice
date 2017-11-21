defmodule Junkmanagerdb.Repo.Migrations.Items do
  use Ecto.Migration

  def change do
    create table :items do
        add :name, :string
        add :description, :string
        add :purchase_price, :float
        add :sale_price, :float
        add :user_id, references(:users)
  
        timestamps()
    end
  end
end
