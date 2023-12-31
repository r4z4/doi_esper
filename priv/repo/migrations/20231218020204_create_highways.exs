defmodule DoiEsper.Repo.Migrations.CreateHighways do
  use Ecto.Migration

  def up do
    create table(:highways, primary_key: false) do
      add :gid,    :integer, primary_key: true, autogenerate: true
      add :feature,   :string
      add :name,   :string
      add :state,   :string
      add :geom,   :geometry
    end
    create index(:highways, [:geom], using: :gist)
  end

  def down do
    drop table(:highways)
  end
end
