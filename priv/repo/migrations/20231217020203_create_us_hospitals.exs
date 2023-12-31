defmodule DoiEsper.Repo.Migrations.CreateUsHospitals do
  use Ecto.Migration

  def up do
    create table(:us_hospitals) do
      add :name,     :string
      add :geom,     :geometry
    end
  end

  def down do
    drop table(:us_hospitals)
  end
end
