defmodule DoiEsper.Repo.Migrations.CreateTownData do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:town_data, primary_key: true) do
      add :year, :integer
      add :code, :integer
      add :town, :string
      add :_2010_census, :integer
      add :gov_assisted, :integer
      add :tenant_rental_assistance, :integer
      add :chfa_usda_mortgages, :integer
      add :deed_restricted, :integer
      add :total_assisted, :integer
      add :percent_assisted, :float
    end
    create unique_index(:town_data, [:id])
  end
end
