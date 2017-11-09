defmodule JunkmanagerWeb.ItemController do
  use JunkmanagerWeb, :controller

  def create(conn, %{"item" => %{"name" => name, "description" => description}}) do
    
  end

  def show(conn, %{ "id" => id }) do
    item = Junkmanagerdb.find_item(id)
    render(conn, "show.html", item: item)
  end
end