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

  pipeline :unauthorized do
    plug :fetch_session
  end

  pipeline :authorized do
    plug :fetch_session
    plug Guardian.Plug.Pipeline, module: PackingList.Guardian,
      error_handler: PackingList.AuthErrorHandler
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  scope "/", PackingListWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/", PackController, :index
    get "/lists", ListsController, :index
    get "/lists/:list_id", ListsController, :show
  end


  scope "/api", PackingListWeb do
    pipe_through :api

    scope "/sessions" do
      scope "/" do
        pipe_through :unauthorized

        post "/sign-in", SessionsController, :sign_in
      end

      scope "/" do
        pipe_through :authorized

        post "/sign-out", SessionsController, :sign_out
        get "/me", SessionsController, :show
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PackingListWeb do
  #   pipe_through :api
  # end
end
