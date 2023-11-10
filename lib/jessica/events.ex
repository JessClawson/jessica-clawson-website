defmodule Jessica.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Jessica.Repo

  alias Jessica.Events.SessionViews

  @doc """
  Returns the list of session_views.

  ## Examples

      iex> list_session_views()
      [%SessionViews{}, ...]

  """
  def list_session_views do
    Repo.all(SessionViews)
  end

  @doc """
  Gets a single session_views.

  Raises `Ecto.NoResultsError` if the Session views does not exist.

  ## Examples

      iex> get_session_views!(123)
      %SessionViews{}

      iex> get_session_views!(456)
      ** (Ecto.NoResultsError)

  """
  def get_session_views!(id), do: Repo.get!(SessionViews, id)

  @doc """
  Creates a session_views.

  ## Examples

      iex> create_session_views(%{field: value})
      {:ok, %SessionViews{}}

      iex> create_session_views(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  # def create_session_views(attrs \\ %{}) do
  #   %SessionViews{}
  #   |> SessionViews.changeset(attrs)
  #   |> Repo.insert()
  # end

  @doc """
  Updates a session_views.

  ## Examples

      iex> update_session_views(session_views, %{field: new_value})
      {:ok, %SessionViews{}}

      iex> update_session_views(session_views, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  # def update_session_views(%SessionViews{} = session_views, attrs) do
  #   session_views
  #   |> SessionViews.changeset(attrs)
  #   |> Repo.update()
  # end

  @doc """
  Deletes a session_views.

  ## Examples

      iex> delete_session_views(session_views)
      {:ok, %SessionViews{}}

      iex> delete_session_views(session_views)
      {:error, %Ecto.Changeset{}}

  """
  def delete_session_views(%SessionViews{} = session_views) do
    Repo.delete(session_views)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking session_views changes.

  ## Examples

      iex> change_session_views(session_views)
      %Ecto.Changeset{data: %SessionViews{}}

  """
  # def change_session_views(%SessionViews{} = session_views, attrs \\ %{}) do
  #   SessionViews.changeset(session_views, attrs)
  # end
end
