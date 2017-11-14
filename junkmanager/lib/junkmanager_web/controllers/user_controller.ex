defmodule JunkmanagerWeb.UserController do
   use JunkmanagerWeb, :controller

   def new(conn, _params) do
    changeset = Junkmanagerdb.User.changeset(%Junkmanagerdb.User{})
     conn |>
     render("new_user.html", errors: [])
   end

   def create(conn, %{"user"=> %{"username" => username, "email" => email, "password" => password}}) do
    result = Junkmanagerdb.add_user(username, email, password)
    IO.inspect result
    case result do 
      {:ok, changeset} -> 
         conn
        |> put_flash(:info, "Your account was succesfully created")
        |> redirect(to: page_path(conn, :index))
      {:error, %{errors: [password: _ ]}} ->
        conn
        |> put_flash(:info, "Password needs to be at least 8 characters")
        |> render("new_user.html", errors: ["Password Length"])
      {:error, %{errors: [username: error]}} ->
        conn
        |> put_flash(:info, "Username already used")
        |> render("new_user.html", errors: error)
       {:error, %{errors: [email: error]}} ->
         conn
         |> put_flash(:info, "Email already used")
         |> render("new_user.html", errors: error)
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
end