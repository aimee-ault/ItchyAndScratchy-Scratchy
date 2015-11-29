defmodule Scratchy.Router do
  use Scratchy.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug PlugCors, [origins: ["localhost:4200"]]
  end

  scope "/", Scratchy do
    pipe_through :api
    
    resources "/categories", CategoryController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end
end
