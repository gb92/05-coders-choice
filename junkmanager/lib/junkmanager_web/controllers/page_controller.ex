defmodule JunkmanagerWeb.PageController do
  use JunkmanagerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", items: Junkmanagerdb.list_item_names
  end

  def new(conn, _params) do
    conn
    |> render ("login.html")
  end

  def create(conn,  %{"user"=> %{ "email" => email, "password" => password}}) do
    user = Junkmanagerdb.auth_user(email, password)

    conn 
    |> valid_user(user)
  end

  def update(conn, _params) do
    conn
    |> Doorman.Login.Session.logout()
    |> put_flash(:info, "Successfully logged out")
    |> redirect(to: page_path(conn, :index))
  end

  def valid_user(conn, user = %Junkmanagerdb.User{}) do
    conn
    |> Doorman.Login.Session.login(user)
    |> put_flash(:info, "Successfully logged in")
    |> redirect(to: item_path(conn, :dashboard))
  end

  def valid_user(conn, _invalid_user) do
    conn
    |> put_flash(:error, "The email/password entered was incorrect")
    |> render("login.html")
  end
end
