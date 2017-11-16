defmodule JunkmanagerWeb.Router do
  use JunkmanagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Doorman.Login.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JunkmanagerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", PageController, :new
    post "/login", PageController, :create
    get "/logout", PageController, :update
  end

  scope "/item", JunkmanagerWeb do
    pipe_through :browser
    
    get "/new", ItemController, :item_form
    post "/new",    ItemController, :create
    get  "/:id", ItemController, :show
  end

  scope "/user", JunkmanagerWeb do
    pipe_through :browser

    get "/new", UserController, :new
    post "/create", UserController, :create
    get "/", UserController, :show
    post "/update", UserController, :update
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", JunkmanagerWeb do
  #   pipe_through :api
  # end
end
