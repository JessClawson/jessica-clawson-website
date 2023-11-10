defmodule Jessica.EventsTest do
  use Jessica.DataCase

  alias Jessica.Events

  describe "session_views" do
    alias Jessica.Events.SessionViews

    import Jessica.EventsFixtures

    @invalid_attrs %{page: nil, session_id: nil}

    test "list_session_views/0 returns all session_views" do
      session_views = session_views_fixture()
      assert Events.list_session_views() == [session_views]
    end

    test "get_session_views!/1 returns the session_views with given id" do
      session_views = session_views_fixture()
      assert Events.get_session_views!(session_views.id) == session_views
    end

    test "create_session_views/1 with valid data creates a session_views" do
      valid_attrs = %{page: "some page", session_id: "some session_id"}

      assert {:ok, %SessionViews{} = session_views} = Events.create_session_views(valid_attrs)
      assert session_views.page == "some page"
      assert session_views.session_id == "some session_id"
    end

    test "create_session_views/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_session_views(@invalid_attrs)
    end

    test "update_session_views/2 with valid data updates the session_views" do
      session_views = session_views_fixture()
      update_attrs = %{page: "some updated page", session_id: "some updated session_id"}

      assert {:ok, %SessionViews{} = session_views} = Events.update_session_views(session_views, update_attrs)
      assert session_views.page == "some updated page"
      assert session_views.session_id == "some updated session_id"
    end

    test "update_session_views/2 with invalid data returns error changeset" do
      session_views = session_views_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_session_views(session_views, @invalid_attrs)
      assert session_views == Events.get_session_views!(session_views.id)
    end

    test "delete_session_views/1 deletes the session_views" do
      session_views = session_views_fixture()
      assert {:ok, %SessionViews{}} = Events.delete_session_views(session_views)
      assert_raise Ecto.NoResultsError, fn -> Events.get_session_views!(session_views.id) end
    end

    test "change_session_views/1 returns a session_views changeset" do
      session_views = session_views_fixture()
      assert %Ecto.Changeset{} = Events.change_session_views(session_views)
    end
  end
end
