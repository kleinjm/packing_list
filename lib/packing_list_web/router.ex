defmodule PackingListWeb.Router do
  use PackingListWeb, :router

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

  scope "/", PackingListWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/pack", PackController, :index
    get "/lists", ListsController, :index
    get "/lists/:list_id", ListsController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PackingListWeb do
  #   pipe_through :api
  # end
end
