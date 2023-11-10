defmodule Jessica.Repo.Migrations.CreateSessionViews do
  use Ecto.Migration

  def change do
    create table(:session_views) do
      add :session_id, :string
      add :page, :string

      timestamps()
    end
  end
end
