defmodule Jessica.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Jessica.Events` context.
  """

  @doc """
  Generate a session_views.
  """
  def session_views_fixture(attrs \\ %{}) do
    {:ok, session_views} =
      attrs
      |> Enum.into(%{
        page: "some page",
        session_id: "some session_id"
      })
      |> Jessica.Events.create_session_views()

    session_views
  end
end
