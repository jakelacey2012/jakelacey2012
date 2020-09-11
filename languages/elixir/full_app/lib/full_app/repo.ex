defmodule FullApp.Repo do
  use Ecto.Repo,
    otp_app: :full_app,
    adapter: Ecto.Adapters.Postgres
end
