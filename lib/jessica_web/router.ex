defmodule JessicaWeb.Router do
  use JessicaWeb, :router

  def put_session_id_if_not_exists(conn) do
    IO.inspect("testing")
    {:ok, conn}
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {JessicaWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug JessicaWeb.SessionPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JessicaWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/about", PageController, :about
    get "/sounds", PageController, :sounds
    get "/formal", PageController, :formal
    get "/rug_savvy", PageController, :rug_savvy
    get "/unsugared", PageController, :unsugared
    get "/contact", PageController, :contact
  end

  # Other scopes may use custom stacks.
  # scope "/api", JessicaWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:jessica, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: JessicaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
