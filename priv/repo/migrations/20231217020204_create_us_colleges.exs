defmodule DoiEsper.Repo.Migrations.CreateUsColleges do
  use Ecto.Migration

  def up do
    create table(:us_colleges) do
      add :name,     :string
      add :geom,     :geometry
    end
  end

  def down do
    drop table(:us_colleges)
  end
end
