defmodule ErrorCop.Router do
  use ErrorCop.Web, :router

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

  scope "/", ErrorCop do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/projects", ProjectController do
      resources "/logs", LogController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ErrorCop do
  #   pipe_through :api
  # end
end
