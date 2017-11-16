defmodule JunkmanagerWeb.UserController do
   use JunkmanagerWeb, :controller

   def new(conn, _params) do
    changeset = Junkmanagerdb.User.changeset(%Junkmanagerdb.User{})
     conn |>
     render("new_user.html", errors: [])
   end

   def create(conn, %{"user"=> %{"username" => username, "email" => email, "password" => password}}) do
    result = Junkmanagerdb.add_user(username, email, password)
    case result do 
      {:ok, changeset} -> 
         conn
        |> put_flash(:info, "Your account was succesfully created")
        |> redirect(to: page_path(conn, :index))
      {:error, %{errors: [password: _ ]}} ->
        conn
        |> handle_create_user_error("Password needs to be at least 8 characters")
      {:error, %{errors: [username: error]}} ->
        conn
        |> handle_create_user_error( "Username already used")
       {:error, %{errors: [email: error]}} ->
         conn
         |> handle_create_user_error("Email already used")
    end
  end

  def show(conn, _params) do
    # TODO: implement page to show user details
    conn 
    |> redirect(to: page_path(conn, :index))
  end

  def update(conn, _params) do
    # TODO: implement page to update user details
    conn 
    |> redirect(to: page_path(conn, :index))
  end

  def  handle_create_user_error(conn, error_message) do
    conn
    |> put_flash(:error, error_message)
    |> render("new_user.html", errors: [])
  end
end