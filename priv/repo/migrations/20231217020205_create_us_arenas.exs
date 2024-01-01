defmodule DoiEsper.Repo.Migrations.CreateUsArenas do
  use Ecto.Migration

  def up do
    create table(:us_arenas) do
      add :stadium,         :string
      add :city,            :string
      add :state,           :string
      add :team,            :string
      add :conference,      :string
      add :capacity,        :string
      add :built,           :string
      add :expanded,        :string
      add :div,             :string
      add :latitude,        :string
      add :longitude,       :string
      add :geom,            :geometry
    end
  end

  def down do
    drop table(:us_arenas)
  end
end
