defmodule DoiEsper.Repo.Migrations.CreatePostgisTest do
  use Ecto.Migration

  def up do
    create table(:postgis_test) do
      add :name,     :string
      add :geom,     :geometry
    end
  end

  def down do
    drop table(:postgis_test)
  end
end
