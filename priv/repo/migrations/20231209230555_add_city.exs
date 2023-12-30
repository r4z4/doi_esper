defmodule DoiEsper.Repo.Migrations.AddCity do
  use Ecto.Migration

  def change do
    create table(:city) do
      add :name, :string, null: false, default: false
      add :latitude, :float, null: true
      add :longitude, :float, null: true
      add :population, :integer, null: false
      add :median_age, :integer, null: true
      add :median_income, :integer, null: true
    end

    create unique_index(:city, [:name])
  end
end
