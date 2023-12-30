defmodule DoiEsper.Repo.Migrations.CreateExtension do
  use Ecto.Migration

  def up do
    # execute "CREATE EXTENSION IF NOT EXISTS vector"
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
  end

  def down do
    # execute "DROP EXTENSION vector"
    execute "DROP EXTENSION postgis"
  end
end
