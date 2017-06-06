defmodule Cuandoesquincena.Router do
  use Cuandoesquincena.Web, :router

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

  scope "/", Cuandoesquincena do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/paypal", PageController, :index
    resources "/silly_messages", SillyMessageController, except: [:new, :edit]
    get "/silly", SillyMessageController, :rand
    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
  end

  # Other scopes may use custom stacks.
  scope "/api", Cuandoesquincena do
    pipe_through :api
    get "/", PageController, :api
  end

end
