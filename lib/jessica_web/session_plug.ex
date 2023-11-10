defmodule JessicaWeb.SessionPlug do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _opts) do
    session = get_session(conn)

    IO.inspect("cool")
    IO.inspect(session)

    session
    |> Map.get("user_id", false)
    |> if do
      conn
    else
      put_session(conn, :user_id, Ecto.UUID.generate())
    end
  end
end
