defmodule JunkmanagerwebWeb.PageController do
  use JunkmanagerwebWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
