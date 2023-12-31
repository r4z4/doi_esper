defmodule DoiEsper.Repo.Migrations.CreateMuni do
  use Ecto.Migration
  def change do
    # System.cmd("psql", ["-h", "localhost", "--port", "5432", "-d", "doi_esper_dev", "-U", "postgres", "-p", "postgres", "-f", "priv/postgis/TOWNSSURVEY_POLY.sql"])
    System.shell("PGPASSWORD=postgres psql -h localhost --port 5432 -d doi_esper_dev -U postgres -f priv/postgis/wgs84.sql")
  end
end
