defmodule JunkmanagerWeb.Router do
  use JunkmanagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JunkmanagerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/item", JunkmanagerWeb do
    pipe_through :browser
    
    get "/new", ItemController, :item_form
    post "/new",    ItemController, :create
    get  "/:id", ItemController, :show
  end
  # Other scopes may use custom stacks.
  # scope "/api", JunkmanagerWeb do
  #   pipe_through :api
  # end
end
