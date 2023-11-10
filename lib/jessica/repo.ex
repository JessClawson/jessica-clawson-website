defmodule Jessica.Repo do
  use Ecto.Repo,
    otp_app: :jessica,
    adapter: Ecto.Adapters.Postgres
end
