defmodule JunkmanagerWeb.ItemController do
  use JunkmanagerWeb, :controller

  def create(conn, %{"item" => %{"name" => name, "description" => description}}) do
    %{ id: new_id } = Junkmanagerdb.add(name, description)
    redirect(conn, to: item_path(conn, :show, new_id))
  end

  def show(conn, %{ "id" => id }) do
    item = Junkmanagerdb.find_item(id)
    render(conn, "show.html", item: item)
  end

  def item_form(conn, _params) do 
    render(conn, "new_item.html")
  end
end