defmodule DoiEsper.Repo.Migrations.CreateExtension do
  use Ecto.Migration

  def up do
    # execute "CREATE EXTENSION IF NOT EXISTS vector"
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
    execute "CREATE EXTENSION IF NOT EXISTS postgis_raster"
    execute "CREATE EXTENSION IF NOT EXISTS fuzzystrmatch"
    execute "CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder"
    execute "CREATE EXTENSION IF NOT EXISTS postgis_topology"
    execute "CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us"
  end

  def down do
    # execute "DROP EXTENSION vector"
    execute "DROP EXTENSION postgis"
    execute "DROP EXTENSION postgis_raster"
    execute "DROP EXTENSION fuzzystrmatch"
    execute "DROP EXTENSION postgis_tiger_geocoder"
    execute "DROP EXTENSION postgis_topology"
    execute "DROP EXTENSION address_standardizer_data_us"
  end
end
