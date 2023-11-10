defmodule Jessica.Events.SessionViews do
  use Ecto.Schema
  import Ecto.Changeset

  schema "session_views" do
    field :page, :string
    field :session_id, :string

    timestamps()
  end

  @doc false
  def create(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:session_id, :page])
    |> validate_required([:session_id, :page])
  end
end
