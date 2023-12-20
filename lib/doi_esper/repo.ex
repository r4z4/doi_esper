defmodule DoiEsper.Repo do
  use Ecto.Repo,
    otp_app: :doi_esper,
    adapter: Ecto.Adapters.Postgres
end
