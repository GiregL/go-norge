defmodule GoNorgeWeb.Router do
  use GoNorgeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {GoNorgeWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", GoNorgeWeb do
    pipe_through :browser

    get "/", MainController, :index

    get "/login", AuthController, :show_login
    post "/login", AuthController, :process_login
    get "/logout", AuthController, :logout

    resources "/notes", NoteController
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:go_norge, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: GoNorgeWeb.Telemetry
    end
  end
end
