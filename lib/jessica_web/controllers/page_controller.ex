defmodule JessicaWeb.PageController do
  use JessicaWeb, :controller

  alias Jessica.Events.SessionViews

  def home(conn, _params) do
    track_view(get_session(conn), "home")

    conn =
      conn
      |> assign(:page_title, "home")

    render(conn, :home)
  end

  def sounds(conn, _params) do
    track_view(get_session(conn), "sounds")
    render(conn, :sounds, layout: false)
  end

  def formal(conn, _params) do
    track_view(get_session(conn), "formal")
    render(conn, :formal, layout: false)
  end

  def rug_savvy(conn, _params) do
    track_view(get_session(conn), "rug_savvy")
    render(conn, :rug_savvy, layout: false)
  end

  def unsugared(conn, _params) do
    track_view(get_session(conn), "unsugared")
    render(conn, :unsugared, layout: false)
  end

  def about(conn, _params) do
    track_view(get_session(conn), "about")

    conn =
      conn
      |> assign(:page_title, "about")

    render(conn, :about)
  end

  def contact(conn, _params) do
    track_view(get_session(conn), "contact")
    render(conn, :contact)
  end

  def track_view(session, page) do
    session_id = Map.get(session, "user_id")

    if session_id do
      SessionViews.create(%{"session_id" => session_id, "page" => page})
      |> Jessica.Repo.insert()
      |> IO.inspect()
    end
  end
end
