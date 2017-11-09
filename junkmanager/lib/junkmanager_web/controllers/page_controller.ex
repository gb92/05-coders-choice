defmodule JunkmanagerWeb.PageController do
  use JunkmanagerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", items: Junkmanagerdb.list_item_names
  end
end
